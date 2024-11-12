import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manifold_callibration/data/dio_provider.dart';
import 'package:manifold_callibration/entities/bet.dart' as domain;
import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';

class BetsRepository {
  BetsRepository({required this.dio});

  final Dio dio;

  Future<List<domain.Bet>> getUserBets(String username) async {
    final betsJson = await _getBets(username);

    // The API returns at most 1000 bets pre request. If we received this many,
    // request the rest of the bets repeatedly.
    var nextBetsJson = betsJson;
    while (nextBetsJson.length == 1000) {
      final nextBetsData = await _getBets(username, betsJson.last.id);

      debugPrint('loop. last id: ${betsJson.last.id}');

      betsJson.addAll(nextBetsData);
    }

    // Map the API representation of bets to a more convenient one.
    final bets = await Future.wait<domain.Bet?>([
      for (final betJson in betsJson) _parseBet(betJson),
    ]);

    return bets.whereType<domain.Bet>().toList();
  }

  Future<domain.Bet?> _parseBet(dynamic betJson) async {
    try {
      final market = await _getMarket(betJson["contractId"] as String);
      if (market == null) {
        return null;
      }

      final bet = domain.Bet(
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
    } on TypeError catch (e) {
      debugPrint(
          'Error parsing bet response. \nJson $betJson\nError: $e\n=======');
      return null;
    }
  }

  Future<domain.Market?> _getMarket(String marketId) async {
    final resp = await dio.get('/market/$marketId');

    if (resp.statusCode != 200) {
      throw HttpException(resp.statusMessage ?? '');
    }

    final marketJson = resp.data;
    try {
      return domain.Market(
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
              _ => null,
            },
          // 'MULTIPLE_CHOICE' =>
          _ => UnimplementedMarketOutcome(),
        },
      );
    } on TypeError catch (e) {
      debugPrint(
          'Error parsing market response. \nJson $marketJson\nError: $e\n=======');
      return null;
    }
  }

  Future<dynamic> _getBets(String username, [String? beforeBetId]) async {
    final resp = await dio.get(
      '/bets',
      queryParameters: {
        'username': username,
        if (beforeBetId != null) 'before': beforeBetId,
      },
    );

    if (resp.statusCode != 200) {
      throw HttpException(resp.statusMessage ?? '');
    }

    if (resp.data case final List<dynamic> betsJson) {
      return betsJson;
    } else {
      throw UnimplementedError();
    }
  }
}

final betsRepositoryProvider = Provider(
  (ref) {
    return BetsRepository(dio: ref.watch(dioProvider));
  },
);
