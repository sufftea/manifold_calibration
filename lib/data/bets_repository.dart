import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manifold_callibration/data/dio_provider.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/context.dart';
import 'package:manifold_callibration/entities/exceptions.dart';
import 'package:manifold_callibration/entities/loading_batch.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';

class BetsRepository {
  BetsRepository(this._dio);

  final Dio _dio;

  Stream<LoadingBatch> getUserBets(Context ctx, String username) async* {
    String? lastBetId;
    List<dynamic> betsJson = [];
    while (true) {
      if (ctx.done) {
        return;
      }

      final batch = await _getBets(ctx, username, lastBetId);
      betsJson.addAll(batch);

      if (batch.length == 10000) {
        lastBetId = betsJson.last['id'];
        continue;
      } else {
        break;
      }
    }

    debugPrint('received ${betsJson.length} user bets. requesting markets');

    const marketBatchSize = 1000;
    Iterable<dynamic> betsJsonIterable = betsJson;
    do {
      if (ctx.done) {
        return;
      }

      debugPrint(
          'requesting $marketBatchSize markets. ${betsJson.length} left');
      final failedMarketIds = <String>[];
      final bets = await Future.wait<Bet?>([
        for (final betJson in betsJsonIterable.take(marketBatchSize))
          () async {
            try {
              final market = await _getMarket(betJson["contractId"] as String);
              if (market == null) {
                return null;
              }

              return _parseBet(betJson, market);
            } on DioException catch (_) {
              debugPrint('error requesting market. bet data: $betJson');
              failedMarketIds.add(betJson["contractId"]);
              return null;
            }
          }(),
      ]);

      if (ctx.done) {
        return;
      }

      final successfulResults = bets.whereType<Bet>().toList();
      betsJsonIterable = betsJsonIterable.skip(marketBatchSize);
      betsJsonIterable.followedBy(failedMarketIds);

      final batch = LoadingBatch(
        bets: successfulResults,
        errored: bets.length - successfulResults.length,
        total: betsJson.length,
        loaded: betsJson.length - betsJsonIterable.length,
      );
      yield batch;
    } while (betsJsonIterable.isNotEmpty);
  }

  Future<Bet?> _parseBet(dynamic betJson, Market market) async {
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
      // TODO: log this
      return null;
    }
  }

  Future<Market?> _getMarket(String marketId) async {
    final Response resp = await _dio.get(
      '/market/$marketId',
    );

    final marketJson = resp.data;
    try {
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
    } on TypeError catch (_) {
      // TODO: log this
      throw UnexpectedResponseException("Hmm. Couldn't parse the response.");
    }
  }

  Future<List<dynamic>> _getBets(Context ctx, String username,
      [String? beforeBetId]) async {
    final Response resp;
    try {
      resp = await _dio.get(
        '/bets',
        queryParameters: {
          'username': username,
          if (beforeBetId != null) 'before': beforeBetId,
        },
      );
    } on DioException catch (_) {
      throw InvalidUsernameException(username);
    }

    if (resp.statusCode != 200) {
      throw InvalidUsernameException(username);
    }

    if (resp.data case final List<dynamic> betsJson) {
      return betsJson;
    } else {
      // TODO: i need to setup logging.
      throw UnexpectedResponseException("Hmm. Couldn't parse the response.");
    }
  }
}

final betsRepositoryProvider = Provider(
  (ref) {
    // return BetsRepositoryMock();
    return BetsRepository(ref.watch(dioProvider));
  },
);
