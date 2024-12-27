import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:manifold_callibration/config.dart';

final dioProvider = Provider(
  (ref) {
    final config = ref.watch(configProvider);
    final dio = Dio(
      BaseOptions(
        baseUrl: config.apiBaseUrl,
      ),
    );

    // _wrapWithFakes(dio, config);

    return dio;
  },
);

void _wrapWithFakes(Dio dio, Config config) {
  final dioAdapter = DioAdapter(
    dio: dio,
    matcher: QueryParamsMatcher(),
  );

  dioAdapter.onGet(
    '/v0/bets',
    (server) async {
      final betsString =
          await File('./assets/test_data/bets.json').readAsString();
      final actualBetsJson = jsonDecode(betsString) as List<dynamic>;

      server.reply(
        200,
        actualBetsJson.take(5000).toList(),
      );
    },
  );

  dioAdapter.onGet(
    RegExp('/v0/user/.+'),
    (server) {
      server.reply(
        200,
        {
          'id': 'userid',
        },
      );
    },
  );
  dioAdapter.onPost(
    '/get-user-contract-metrics-with-contracts',
    (server) async {
      final metricsString = await File(
              './assets/test_data/get-user-contract-metrics-with-contracts.json')
          .readAsString();
      final actualUserContractsJson = jsonDecode(metricsString);

      server.reply(
        200,
        actualUserContractsJson,
      );
    },
  );
}

class QueryParamsMatcher extends HttpRequestMatcher {
  @override
  bool matches(RequestOptions ongoingRequest, Request matcher) {
    final isTheSameRoute =
        ongoingRequest.doesRouteMatch(ongoingRequest.path, matcher.route);

    return isTheSameRoute;
  }
}
