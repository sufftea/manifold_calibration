import 'dart:io';

import 'package:dio/dio.dart';
import 'package:manifold_callibration/data/entities/bet.dart';
import 'package:manifold_callibration/data/entities/market.dart';

class BetsRepository {
  BetsRepository({required this.dio});

  final Dio dio;

  Future<List<Bet>> getUserBets(String username, [String? beforeBetId]) async {
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
    for (final bet in betsJson) {
      final marketId = bet["contractId"];

      final marketResp = await dio.get('/market/$marketId');

      if (marketResp.statusCode != 200) {
        throw HttpException(resp.statusMessage ?? '');
      }

      final marketJson = marketResp.data;

      final market = Market(
        id: marketJson["id"] as String,
        outcomeType: marketJson["outcomeType"] as String,
        isResolved: marketJson["isResolved"] as bool,
        resolution: marketJson["resolution"] as String?,
        resolutionProbability: marketJson["resolutionProbability"] as double?,
      );

      Bet(
        id: bet["id"] as String,
        outcome: bet["outcome"] as String,
        probAfter: bet["probAfter"] as double,
        updatedTime: bet["updatedTime"] as int,
        market: market,
      );
    }

    if (bets.length == 1000) {
      bets.addAll(await getUserBets(username, bets.last.id));
    }

    return bets;
  }
}
