import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manifold_callibration/config.dart';
import 'package:manifold_callibration/data/bets_repository_mock.dart';
import 'package:manifold_callibration/data/dio_provider.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/context.dart';
import 'package:manifold_callibration/entities/exceptions.dart';
import 'package:manifold_callibration/entities/loading_batch.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';

class BetsRepository {
  BetsRepository(this._dio, this._config);

  final Config _config;
  final Dio _dio;

  Stream<LoadingBatch> getUserBets(Context ctx, String username) async* {
    // fetch all user's bets in json
    // The max number of bets returned at once is 10000. If we receive this many,
    // make another request to fetch the rest.
    String? lastBetId;
    List<dynamic> betsJson = [];
    while (true) {
      if (ctx.done) {
        return;
      }

      final batch = await _getBetsJson(username, lastBetId);
      betsJson.addAll(batch);

      if (batch.length == _config.manifoldBetsPerRequestLimit) {
        lastBetId = betsJson.last['id'];
        continue;
      } else {
        break;
      }
    }

    debugPrint('received ${betsJson.length} user bets. requesting markets');

    final marketIdToBetsJson = <String, List<dynamic>>{};
    for (final betJson in betsJson) {
      if (betJson["contractId"] case final marketId?) {
        if (marketIdToBetsJson[marketId] case final betsForMarket?) {
          betsForMarket.add(betJson);
        } else {
          marketIdToBetsJson[marketId] = [betJson];
        }
      }
    }

    var uniqueMraketIds = marketIdToBetsJson.keys;
    final totalMarketIds = uniqueMraketIds.length;

    do {
      if (ctx.done) {
        return;
      }

      final marketIdsBatch =
          uniqueMraketIds.take(_config.marketRequestBatchSize);

      final failedMarketIds = <String>[];
      final markets = await Future.wait<Market?>(
        [
          for (final marketId in marketIdsBatch)
            () async {
              final market = await _getMarket(marketId);
              if (market == null) {
                failedMarketIds.add(marketId);
              }
              return market;
            }()
        ],
      );
      await Future.delayed(const Duration(milliseconds: 100));

      debugPrint(
          'fetched ${markets.length} markets. ${uniqueMraketIds.length} left');

      final bets = <Bet>[];
      for (final market in markets.nonNulls) {
        if (marketIdToBetsJson[market.id] case final betsJson?) {
          for (final betJson in betsJson) {
            final bet = _parseBet(betJson, market);
            if (bet == null) {
              continue;
            }
            bets.add(bet);
          }
        }
      }

      uniqueMraketIds = uniqueMraketIds.skip(_config.marketRequestBatchSize);
      uniqueMraketIds.followedBy(failedMarketIds);
      final batch = LoadingBatch(
        bets: bets,
        errored: 0,
        total: totalMarketIds,
        loaded: totalMarketIds - uniqueMraketIds.length,
      );

      if (ctx.done) {
        return;
      }
      yield batch;
    } while (uniqueMraketIds.isNotEmpty);
  }

  Bet? _parseBet(dynamic betJson, Market market) {
    try {
      final bet = Bet(
        id: betJson["id"] as String,
        outcome: switch (betJson["outcome"] as String) {
          'YES' =>
            BinaryYesBetOutcome(probAfter: betJson["probAfter"] as double),
          'NO' => BinaryNoBetOutcome(probAfter: betJson["probAfter"] as double),
          _ => UnimplementedBetOutcome(),
        },
        updatedTime:
            DateTime.fromMillisecondsSinceEpoch(betJson["updatedTime"] as int),
        market: market,
      );

      return bet;
    } on TypeError catch (_) {
      debugPrint('failed to parse bet: $betJson');
      return null;
    }
  }

  Future<Market?> _getMarket(String marketId) async {
    try {
      final Response resp = await _dio.get(
        '/market/$marketId',
      );

      final marketJson = resp.data;

      return Market(
        id: marketJson["id"] as String,
        outcome: switch (marketJson["outcomeType"]) {
          'BINARY' => switch (marketJson["resolution"]) {
              'YES' => BinaryYesMarketOutcome(),
              'NO' => BinaryNoMarketOutcome(),
              'MKT' => () {
                  if (marketJson["resolutionProbability"]
                      case final double resolutionProbability) {
                    return BinaryMktMarketOutcome(
                      probability: resolutionProbability,
                    );
                  } else {
                    return UnimplementedMarketOutcome();
                  }
                }(),
              null => null,
              _ => UnimplementedMarketOutcome(),
            },
          // 'MULTIPLE_CHOICE' =>
          _ => UnimplementedMarketOutcome(),
        },
      );
    } on DioException catch (_) {
      debugPrint('error requesting market: $marketId');
      return null;
    } on TypeError catch (_) {
      throw UnexpectedResponseException("Couldn't parse the response.");
    }
  }

  Future<List<dynamic>> _getBetsJson(String username,
      [String? beforeBetId]) async {
    try {
      final resp = await _dio.get(
        '/bets',
        queryParameters: {
          'username': username,
          if (beforeBetId != null) 'before': beforeBetId,
        },
      );

      if (resp.data case final List<dynamic> betsJson) {
        return betsJson;
      } else {
        throw UnexpectedResponseException("Unexpected response");
      }
    } on DioException catch (_) {
      throw InvalidUsernameException(username);
    }
  }
}

final betsRepositoryProvider = Provider(
  (ref) {
    return BetsRepositoryMock();
    return BetsRepository(
      ref.watch(dioProvider),
      ref.watch(configProvider),
    );
  },
);
