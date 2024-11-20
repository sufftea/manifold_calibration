import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:manifold_callibration/config.dart';
import 'package:manifold_callibration/data/bets_repository.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/context.dart';

void main() {
  group("Doesn't crash when fetching and parsing the response", () {
    const path = 'https://api.manifold.markets/v0';
    final dio = Dio(BaseOptions(baseUrl: path));
    final dioAdapter = DioAdapter(
      dio: dio,
      matcher: QueryParamsMatcher(),
    );

    const username = 'xX_manaMaximizer3000_Xx';
    List<dynamic>? allBetsJson;

    setUpAll(
      () async {
        final betsString = await File('./test_data/bets.json').readAsString();
        allBetsJson = jsonDecode(betsString) as List<dynamic>;
      },
    );

    test(
      'getUserBets fetches all 100 the bets returned by the api',
      () async {
        const nofReturnedBets = 100;
        dioAdapter.onGet(
          '/bets',
          (server) {
            server.reply(
              200,
              allBetsJson!.take(nofReturnedBets).toList(),
            );
          },
        );

        dioAdapter.onGet(
          RegExp(r'/market/.+'),
          (server) async {
            server.replyCallbackAsync(
              200,
              (options) async {
                final marketId = options.path.split('/').last;

                var marketString =
                    await File('./test_data/markets/$marketId.json')
                        .readAsString();
                final marketJson = jsonDecode(marketString);

                return marketJson;
              },
            );
          },
        );

        final repo = BetsRepository(
          dio,
          Config(
            marketRequestBatchSize: 5,
            manifoldBetsPerRequestLimit: 1000,
          ),
        );
        final (_, ctx) = Context.withCancel();

        final bets = <Bet>[];
        await for (final batch in repo.getUserBets(ctx, username)) {
          bets.addAll(batch.bets);
        }

        expect(bets.length, equals(nofReturnedBets));
      },
    );

    test(
      'if there are more than manifoldBetsPerRequestLimit bets, getUserBets still fetches all of them',
      () async {
        const manifoldBetsPerRequestLimit = 10;
        const totalUserBets = 100;

        dioAdapter.onGet(
          RegExp('/bets.*'),
          (server) {
            server.replyCallback(
              200,
              (options) {
                debugPrint('returning bets');
                final beforeBetId =
                    options.queryParameters['before'] as String?;

                if (beforeBetId == null) {
                  return allBetsJson!.take(totalUserBets).toList();
                }

                return allBetsJson!
                    .take(totalUserBets)
                    .skipWhile((value) {
                      return value['id'] != beforeBetId;
                    })
                    .take(manifoldBetsPerRequestLimit)
                    .toList();
              },
            );
          },
        );

        dioAdapter.onGet(
          RegExp(r'/market/.+'),
          (server) async {
            server.replyCallbackAsync(
              200,
              (options) async {
                final marketId = options.path.split('/').last;

                var marketString =
                    await File('./test_data/markets/$marketId.json')
                        .readAsString();
                final marketJson = jsonDecode(marketString);

                return marketJson;
              },
            );
          },
        );

        final repo = BetsRepository(
          dio,
          Config(
            marketRequestBatchSize: 10,
            manifoldBetsPerRequestLimit: manifoldBetsPerRequestLimit,
          ),
        );
        final (_, ctx) = Context.withCancel();

        final bets = <Bet>[];
        await for (final batch in repo.getUserBets(ctx, username)) {
          bets.addAll(batch.bets);
        }

        expect(bets.length, equals(totalUserBets));
      },
    );
  });
}

class QueryParamsMatcher extends HttpRequestMatcher {
  @override
  bool matches(RequestOptions ongoingRequest, Request matcher) {
    final isTheSameRoute =
        ongoingRequest.doesRouteMatch(ongoingRequest.path, matcher.route);
    // debugPrint(
    //     'ongoing path: ${ongoingRequest.path}; route: ${matcher.route}. match: $isTheSameRoute');

    return isTheSameRoute;
  }
}
