import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:manifold_callibration/data/bets_parser.dart';

void main() {
  group(
    'parse the entire response',
    () {
      List<dynamic>? actualBetsJson;

      setUpAll(
        () async {
          final betsString =
              await File('./assets/test_data/bets.json').readAsString();
          actualBetsJson = jsonDecode(betsString) as List<dynamic>;
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
    },
  );

  group(
    'specific cases',
    () {
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
