import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:manifold_callibration/config.dart';
import 'package:manifold_callibration/data/bets_parser.dart';
import 'package:manifold_callibration/data/bets_repository.dart';
import 'package:manifold_callibration/data/markets_parser.dart';
import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';

void main() {
  group("repository", () {
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
  });

  group(
    'parsers',
    () {
      List<dynamic>? actualBetsJson;
      dynamic userContractsJson;
      int numberOfContracts = 100;

      setUpAll(
        () async {
          final metricsString = await File(
                  './assets/test_data/get-user-contract-metrics-with-contracts.json')
              .readAsString();
          userContractsJson = jsonDecode(metricsString);

          final contractsList = userContractsJson['contracts'] as List<dynamic>;
          numberOfContracts = contractsList.length;

          final betsString =
              await File('./assets/test_data/bets.json').readAsString();
          actualBetsJson = jsonDecode(betsString) as List<dynamic>;
        },
      );

      test(
        'parse markets',
        () {
          final marketParser = MarketsParser();

          final parsedMarkets =
              marketParser.parseUserMetrics(userContractsJson);

          expect(parsedMarkets.length, equals(numberOfContracts));
        },
      );
      test(
        'parse bets',
        () {
          final parser = BetsParser();
          final parsedBets = parser.parseBets(actualBetsJson!);
          expect(parsedBets.length, equals(actualBetsJson!.length));
        },
      );

      test(
        'parse multiple-choice NO bet',
        () {
          const expectedAmount = 50;
          const expectedBetId = "somebetid";
          const expectedMarketId = "contractId";
          const expectedAnswerId = 'answerId';

          final jsonString = """
            {
              "id": "$expectedBetId",
              "fees": {
                "creatorFee": 0,
                "platformFee": 0,
                "liquidityFee": 0
              },
              "fills": [
                {
                  "fees": {
                    "creatorFee": 0,
                    "platformFee": 0,
                    "liquidityFee": 0
                  },
                  "amount": 50,
                  "shares": 83.33333333333333,
                  "timestamp": 1734862625898,
                  "matchedBetId": null
                }
              ],
              "isApi": false,
              "amount": $expectedAmount,
              "shares": 83.33333333333333,
              "userId": "hDq0cvn68jbAUVd6aWIU9aSv9ZA2",
              "outcome": "NO",
              "answerId": "$expectedAnswerId",
              "isFilled": true,
              "probAfter": 0.3076923076923077,
              "contractId": "$expectedMarketId",
              "loanAmount": 0,
              "probBefore": 0.5,
              "visibility": "public",
              "createdTime": 1734862625000,
              "isCancelled": false,
              "orderAmount": 50,
              "isRedemption": false,
              "betId": "$expectedBetId",
              "updatedTime": 1734862625000
            }
          """;

          final decodedJson = jsonDecode(jsonString);

          final parser = BetsParser();
          final parsedBet = parser.parseBet(decodedJson);

          expect(parsedBet, isNotNull);

          expect(parsedBet?.outcome, isA<MultipleChoiceBetOutcomeNo>());

          if (parsedBet?.outcome case final MultipleChoiceBetOutcome outcome) {
            expect(outcome.answerId, equals(expectedAnswerId));
          }

          expect(parsedBet?.amount, equals(expectedAmount));
          expect(parsedBet?.id, equals(expectedBetId));
          expect(parsedBet?.marketId, equals(expectedMarketId));
        },
      );
      test(
        'parse multiple-choice market with shouldAnswersSumToOne: false',
        () async {
          final contractString = await File(
                  './assets/test_data/multiple-choice-contract-sum-to-one-false.json')
              .readAsString();
          final contractJson = jsonDecode(contractString);

          final parser = MarketsParser();
          final parsedMarket = parser.parseMarket(contractJson);

          expect(parsedMarket, isNotNull);
          expect(parsedMarket?.id, equals("AQyNPpQZhR"));

          expect(parsedMarket?.outcome, isA<MultipleChoiceMarketOutcome>());
          if (parsedMarket?.outcome
              case MultipleChoiceMarketOutcome(
                answerOutcomes: final answerOutcomes,
              )) {
            expect(answerOutcomes[0].answerId, equals("0RzA5lAqp8"));
            expect(answerOutcomes[0], isA<MultipleChoiceAnswerOutcomeYes>());

            expect(answerOutcomes[1].answerId, equals("qPsItE2RCu"));
            expect(answerOutcomes[1], isA<MultipleChoiceAnswerOutcomeYes>());

            expect(answerOutcomes[2].answerId, equals("620l0Ncu2p"));
            expect(answerOutcomes[2], isA<MultipleChoiceAnswerOutcomeNo>());
          }
        },
      );
      test(
        'parse multiple-choice market with shouldAnswersSumToOne: true',
        () async {
          final contractString = await File(
                  './assets/test_data/multiple-choice-contract-sum-to-one-true.json')
              .readAsString();
          final contractJson = jsonDecode(contractString);

          final parser = MarketsParser();
          final parsedMarket = parser.parseMarket(contractJson);

          expect(parsedMarket, isNotNull);
          expect(parsedMarket?.id, equals("0o5uq3fv2s"));

          expect(parsedMarket?.outcome, isA<MultipleChoiceMarketOutcome>());
          const expectedResolutionId = "kodz1sl7lq";
          if (parsedMarket?.outcome
              case MultipleChoiceMarketOutcome(
                answerOutcomes: final answerOutcomes,
              )) {
            for (final outcome in answerOutcomes) {
              if (outcome.answerId == expectedResolutionId) {
                expect(outcome, isA<MultipleChoiceAnswerOutcomeYes>());
              } else {
                expect(outcome, isA<MultipleChoiceAnswerOutcomeNo>());
              }
            }
          }
        },
      );

      test(
        'parseBet returns null if the json is missing the required fields',
        () {
          final jsonString = """
            {
              "fees": {
                "creatorFee": 0,
                "platformFee": 0,
                "liquidityFee": 0
              },
              "fills": [
                {
                  "fees": {
                    "creatorFee": 0,
                    "platformFee": 0,
                    "liquidityFee": 0
                  },
                  "amount": 50,
                  "shares": 83.33333333333333,
                  "timestamp": 1734862625898,
                  "matchedBetId": null
                }
              ],
              "isApi": false,
              "shares": 83.33333333333333,
              "userId": "hDq0cvn68jbAUVd6aWIU9aSv9ZA2",
              "outcome": "NO",
              "isFilled": true,
              "probAfter": 0.3076923076923077,
              "loanAmount": 0,
              "probBefore": 0.5,
              "visibility": "public",
              "createdTime": 1734862625000,
              "isCancelled": false,
              "orderAmount": 50,
              "isRedemption": false,
              "updatedTime": 1734862625000
            }
          """;

          final decodedJson = jsonDecode(jsonString);

          final parser = BetsParser();
          final parsedBet = parser.parseBet(decodedJson);

          expect(parsedBet, isNull);
        },
      );
      test(
        'parseBet returns null if one of the json values is of an unexpected type',
        () {
          const expectedAmount = 50;
          const expectedBetId = "somebetid";
          const expectedMarketId = "contractId";
          const expectedAnswerId = 'answerId';

          final jsonString = """
            {
              "id": "$expectedBetId",
              "fees": {
                "creatorFee": 0,
                "platformFee": 0,
                "liquidityFee": 0
              },
              "fills": [
                {
                  "fees": {
                    "creatorFee": 0,
                    "platformFee": 0,
                    "liquidityFee": 0
                  },
                  "amount": 50,
                  "shares": 83.33333333333333,
                  "timestamp": 1734862625898,
                  "matchedBetId": null
                }
              ],
              "isApi": false,
              "amount": "$expectedAmount",
              "shares": 83.33333333333333,
              "userId": "hDq0cvn68jbAUVd6aWIU9aSv9ZA2",
              "outcome": "NO",
              "answerId": "$expectedAnswerId",
              "isFilled": true,
              "probAfter": 0.3076923076923077,
              "contractId": "$expectedMarketId",
              "loanAmount": 0,
              "probBefore": 0.5,
              "visibility": "public",
              "createdTime": 1734862625000,
              "isCancelled": false,
              "orderAmount": 50,
              "isRedemption": false,
              "betId": "$expectedBetId",
              "updatedTime": 1734862625000
            }
          """;

          final decodedJson = jsonDecode(jsonString);

          final parser = BetsParser();
          final parsedBet = parser.parseBet(decodedJson);

          expect(parsedBet, isNull);
        },
      );
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
