import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manifold_callibration/data/dio_provider.dart';
import 'package:manifold_callibration/data/entities/bet.dart';
import 'package:manifold_callibration/entities/bet.dart' as domain;
import 'package:manifold_callibration/data/entities/market.dart';
import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';

class BetsRepository {
  BetsRepository({required this.dio});

  final Dio dio;

  Future<List<domain.Bet>> getUserBets(String username) async {
    final betsData = await _getBets(username);

    // The API returns at most 1000 bets pre request. If we received this many,
    // request the rest of the bets repeatedly.
    var nextBetsData = betsData;
    while (nextBetsData.length == 1000) {
      final nextBetsData = await _getBets(username, betsData.last.id);

      betsData.addAll(nextBetsData);
    }

    // Map the API representation of bets to a more convenient one.
    final bets = <domain.Bet>[];
    for (final betData in betsData) {
      final marketData = await _getMarket(betData.marketId);

      final market = domain.Market(
          id: betData.marketId,
          outcome: switch (marketData.outcomeType) {
            'BINARY' => switch (marketData.resolution) {
                'YES' => BinaryYesMarketOutcome(),
                'NO' => BinaryNoMarketOutcome(),
                'MKT' => () {
                    if (marketData.resolutionProbability
                        case final resolutionProbability?) {
                      return BinaryMktMarketOutcome(
                        probability: resolutionProbability,
                      );
                    } else {
                      return UnimplementedMarketOutcome();
                    }
                  }(),
                _ => UnimplementedMarketOutcome(),
              },
            _ => UnimplementedMarketOutcome(),
          });

      final bet = domain.Bet(
        id: betData.id,
        outcome: switch (betData.outcome) {
          'YES' => BinaryYesBetOutcome(probAfter: betData.probAfter),
          'NO' => BinaryNoBetOutcome(probAfter: betData.probAfter),
          _ => UnimplementedBetOutcome(),
        },
        updatedTime: DateTime.fromMillisecondsSinceEpoch(betData.updatedTime),
        market: market,
      );

      bets.add(bet);
    }

    return bets;
  }

  Future<Market> _getMarket(String marketId) async {
    final resp = await dio.get('/market/$marketId');

    if (resp.statusCode != 200) {
      throw HttpException(resp.statusMessage ?? '');
    }

    final marketJson = resp.data;

    final market = Market(
      id: marketJson["id"] as String,
      outcomeType: marketJson["outcomeType"] as String,
      isResolved: marketJson["isResolved"] as bool,
      resolution: marketJson["resolution"] as String?,
      resolutionProbability: marketJson["resolutionProbability"] as double?,
    );

    return market;
  }

  Future<List<Bet>> _getBets(String username, [String? beforeBetId]) async {
    final resp = await dio.get(
      '/bets',
      queryParameters: {
        'username': username,
        'limit': 10, // TODO temporal!
        if (beforeBetId != null) 'before': beforeBetId,
      },
    );

    if (resp.statusCode != 200) {
      throw HttpException(resp.statusMessage ?? '');
    }

    final betsJson = resp.data as List<dynamic>;
    final bets = <Bet>[];
    for (final betJson in betsJson) {
      final bet = Bet(
        id: betJson["id"] as String,
        outcome: betJson["outcome"] as String,
        probAfter: betJson["probAfter"] as double,
        updatedTime: betJson["updatedTime"] as int,
        marketId: betJson["contractId"],
      );

      bets.add(bet);
    }

    return bets;
  }
}

final betsRepositoryProvider = Provider(
  (ref) {
    return BetsRepository(dio: ref.watch(dioProvider));
  },
);
