import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:manifold_callibration/config.dart';
import 'package:manifold_callibration/data/bets_repository.dart';

void main() {
  const path = 'https://api.manifold.markets';
  final dio = Dio(BaseOptions(baseUrl: path));
  final dioAdapter = DioAdapter(
    dio: dio,
    matcher: QueryParamsMatcher(),
  );

  const actualUsername = 'xX_manaMaximizer3000_Xx';
  const actualUserId = "userid";
  List<dynamic>? actualBetsJson;
  dynamic actualUserContractsJson;

  setUpAll(
    () async {
      final betsString =
          await File('./assets/test_data/bets.json').readAsString();
      actualBetsJson = jsonDecode(betsString) as List<dynamic>;

      final metricsString = await File(
              './assets/test_data/get-user-contract-metrics-with-contracts.json')
          .readAsString();
      actualUserContractsJson = jsonDecode(metricsString);

      final contractsList =
          actualUserContractsJson['contracts'] as List<dynamic>;
      actualUserContractsJson['contracts'] = contractsList.take(100).toList();
    },
  );

  test(
    'getUserBets fetches all 100 the bets returned by the api',
    () async {
      const nofReturnedBets = 100;
      dioAdapter.onGet(
        '/v0/bets',
        (server) {
          server.reply(
            200,
            actualBetsJson!.take(nofReturnedBets).toList(),
          );
        },
      );

      dioAdapter.onGet(
        RegExp('/v0/user/.+'),
        (server) {
          server.replyCallback(
            200,
            (options) {
              expect(
                options.path.split('/').last,
                equals(actualUsername),
              );
              return {
                'id': actualUserId,
              };
            },
          );
        },
      );
      dioAdapter.onPost(
        '/get-user-contract-metrics-with-contracts',
        (server) async {
          server.replyCallback(
            200,
            (options) {
              final {
                "userId": userId,
                "limit": _,
              } = options.data;

              expect(
                userId,
                equals(actualUserId),
              );
              return actualUserContractsJson;
            },
          );
        },
      );

      final repo = BetsRepository(
        dio,
        Config(
          manifoldBetsPerRequestLimit: 1000,
        ),
      );

      final bets = await repo.getUserBets(actualUsername);

      expect(bets.length, equals(nofReturnedBets));
    },
  );

  test(
    'if there are more than manifoldBetsPerRequestLimit bets, getUserBets still fetches all of them',
    () async {
      const manifoldBetsPerRequestLimit = 10;
      const totalUserBets = 100;

      dioAdapter.onGet(
        RegExp('/v0/bets.*'),
        (server) {
          server.replyCallback(
            200,
            (options) {
              final String? before = options.queryParameters['before'];
              final String? username = options.queryParameters['username'];

              expect(username, equals(actualUsername));

              if (before == null) {
                return actualBetsJson!.take(totalUserBets).toList();
              }

              return actualBetsJson!
                  .take(totalUserBets)
                  .skipWhile((value) {
                    return value['id'] != before;
                  })
                  .take(manifoldBetsPerRequestLimit)
                  .toList();
            },
          );
        },
      );
      dioAdapter.onGet(
        RegExp('/v0/user/.+'),
        (server) {
          server.replyCallback(
            200,
            (options) {
              expect(
                options.path.split('/').last,
                equals(actualUsername),
              );
              return {
                'id': actualUserId,
              };
            },
          );
        },
      );

      dioAdapter.onPost(
        RegExp(r'/get-user-contract-metrics-with-contracts'),
        (server) async {
          server.reply(
            200,
            actualUserContractsJson,
          );
        },
      );

      final repo = BetsRepository(
        dio,
        Config(
          manifoldBetsPerRequestLimit: manifoldBetsPerRequestLimit,
        ),
      );

      final bets = await repo.getUserBets(actualUsername);
      expect(bets.length, equals(totalUserBets));
    },
  );
}

class QueryParamsMatcher extends HttpRequestMatcher {
  @override
  bool matches(RequestOptions ongoingRequest, Request matcher) {
    final isTheSameRoute =
        ongoingRequest.doesRouteMatch(ongoingRequest.path, matcher.route);
    debugPrint(
        'ongoing path: ${ongoingRequest.path}; route: ${matcher.route}. match: $isTheSameRoute');

    return isTheSameRoute;
  }
}
