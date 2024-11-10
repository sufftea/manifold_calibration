import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manifold_callibration/data/bets_repository.dart';

void main() {
  test('get my bets', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.manifold.markets/v0'));
    final repo = BetsRepository(dio: dio);

    final bets = await repo.getUserBets('SlipperySloe');

    debugPrint(bets.toString());
  });
}
