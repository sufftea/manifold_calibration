import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manifold_callibration/config.dart';
import 'package:manifold_callibration/data/bets_parser.dart';
import 'package:manifold_callibration/data/dio_provider.dart';
import 'package:manifold_callibration/data/markets_parser.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/exceptions.dart';
import 'package:manifold_callibration/entities/market.dart';

class BetsRepository {
  BetsRepository(this._dio, this._config);

  final MarketsParser _marketsParser = MarketsParser();
  final BetsParser _betsParser = BetsParser();
  final Config _config;
  final Dio _dio;

  Future<List<Bet>> getUserBets(String username) async {
    final userId = await _getUserId(username);

    final betsJson = await _getAllUserBetsJson(username);

    debugPrint('received ${betsJson.length} user bets. requesting markets');

    final markets = await _getAllMarketsJson(userId);
    final idToMarket = <String, Market>{
      for (final market in markets) market.id: market,
    };

    final bets = _betsParser.parseBets(betsJson);

    final betsWithMarkets = <Bet>[];
    for (final bet in bets) {
      if (idToMarket[bet.marketId] case final market?) {
        bet.market = market;
        betsWithMarkets.add(bet);
      }
    }

    return betsWithMarkets;
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

  Future<List<Market>> _getAllMarketsJson(String userId) async {
    int lastOffset = 0;
    List<Market> metricsJson = [];
    while (true) {
      final batch = await _getMetricsJson(userId, lastOffset);
      final batchParsed = _marketsParser.parseUserMetrics(batch);

      metricsJson.addAll(batchParsed);

      if (batch.length == _config.manifoldBetsPerRequestLimit) {
        lastOffset += 10000;
        continue;
      } else {
        break;
      }
    }

    return metricsJson;
  }

  Future<dynamic> _getMetricsJson(String userId, int lastOffset) async {
    final resp = await _dio.get(
      '/v0/get-user-contract-metrics-with-contracts',
      queryParameters: {
        "userId": userId,
        "limit": 10000,
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
}

final betsRepositoryProvider = Provider(
  (ref) {
    return BetsRepository(
      ref.watch(dioProvider),
      ref.watch(configProvider),
    );
  },
);
