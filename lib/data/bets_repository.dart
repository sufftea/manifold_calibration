import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manifold_callibration/config.dart';
import 'package:manifold_callibration/data/dio_provider.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/exceptions.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';

class BetsRepository {
  BetsRepository(this._dio, this._config);

  final Config _config;
  final Dio _dio;

  Future<List<Bet>> getUserBets(String username) async {
    final userId = await _getUserId(username);

    final betsJson = await _getAllUserBetsJson(username);

    debugPrint('received ${betsJson.length} user bets. requesting markets');

    final metricsJson = await _getMetricsJson(userId);
    final markets = _parseMetrics(metricsJson);
    final idToMarket = <String, Market>{
      for (final market in markets) market.id: market,
    };

    final bets = betsJson
        .map(
          (betJson) {
            return _parseBet(betJson, idToMarket);
          },
        )
        .nonNulls
        .toList();

    return bets;
  }

  // Fetch all user's bets in json
  // The max number of bets returned at once is 10000. If we receive this many,
  // make another request to fetch the rest.
  Future<List<dynamic>> _getAllUserBetsJson(String username) async {
    String? lastBetId;
    List<dynamic> betsJson = [];
    while (true) {
      final batch = await _getUserBetsJson(username, lastBetId);
      if (batch is! List<dynamic>) {
        throw UnexpectedResponseException('');
      }

      betsJson.addAll(batch);

      if (batch.length == _config.manifoldBetsPerRequestLimit) {
        lastBetId = betsJson.last['id'];
        continue;
      } else {
        break;
      }
    }

    return betsJson;
  }

  List<Market> _parseMetrics(dynamic metricsJson) {
    try {
      final List<dynamic> marketsJson = metricsJson['data']['contracts'];

      final result = <Market?>[
        for (final marketJson in marketsJson) _parseMarket(marketJson),
      ];

      return result.nonNulls.toList();
    } on TypeError catch (_) {
      throw UnexpectedResponseException("Couldn't parse markets");
    }
  }

  Market? _parseMarket(dynamic marketJson) {
    try {
      final double? resolutionProbability = marketJson['resolutionProbability'];
      final String? resolution = marketJson['resolution'];
      final String outcomeType = marketJson['outcomeType'];
      final String id = marketJson['id'];

      final market = Market(
        id: id,
        outcome: switch (outcomeType) {
          'BINARY' => switch (resolution) {
              'YES' => BinaryYesMarketOutcome(),
              'NO' => BinaryNoMarketOutcome(),
              'MKT' => switch (resolutionProbability) {
                  double resolutionProbability =>
                    BinaryMktMarketOutcome(probability: resolutionProbability),
                  null => null,
                },
              null => null,
              _ => UnimplementedMarketOutcome(),
            },
          // 'MULTIPLE_CHOICE' =>
          _ => UnimplementedMarketOutcome(),
        },
      );

      return market;
    } on TypeError catch (_) {
      // throw UnexpectedResponseException("Couldn't parse markets");
      return null;
    }
  }

  Future<dynamic> _getMetricsJson(String userId) async {
    final resp = await _dio.post(
      '/get-user-contract-metrics-with-contracts',
      data: {
        "userId": userId,
        "limit": 999999999,
      },
    );

    return resp.data;
  }

  Future<dynamic> _getUserBetsJson(
    String username, [
    String? beforeBetId,
  ]) async {
    try {
      final resp = await _dio.get(
        '/v0/bets',
        queryParameters: {
          'username': username,
          if (beforeBetId != null) 'before': beforeBetId,
        },
      );

      return resp.data;
    } on DioException catch (_) {
      throw InvalidUsernameException(username);
    }
  }

  Future<String> _getUserId(String username) async {
    try {
      final resp = await _dio.get(
        '/v0/user/$username',
      );

      if (resp.data case <dynamic, dynamic>{'id': final String userId}) {
        return userId;
      }
      throw InvalidUsernameException(username);
    } on DioException catch (_) {
      throw InvalidUsernameException(username);
    }
  }

  Bet? _parseBet(dynamic betJson, Map<String, Market> idToMarket) {
    try {
      final <dynamic, dynamic>{
        'id': String id,
        'outcome': String outcome,
        'probAfter': double probAfter,
        'updatedTime': int updatedTime,
        'contractId': String contractId,
      } = betJson;

      final market = idToMarket[contractId];
      if (market == null) {
        return null;
      }

      final bet = Bet(
        id: id,
        outcome: switch (outcome) {
          'YES' => BinaryYesBetOutcome(probAfter: probAfter),
          'NO' => BinaryNoBetOutcome(probAfter: probAfter),
          _ => UnimplementedBetOutcome(),
        },
        updatedTime: DateTime.fromMillisecondsSinceEpoch(updatedTime),
        market: market,
      );

      return bet;
    } on TypeError catch (_) {
      debugPrint('failed to parse bet: $betJson;');
      return null;
    }
  }
}

final betsRepositoryProvider = Provider(
  (ref) {
    // return BetsRepositoryMock();
    return BetsRepository(
      ref.watch(dioProvider),
      ref.watch(configProvider),
    );
  },
);
