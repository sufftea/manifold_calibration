import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:manifold_callibration/data/markets_parser.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';

void main() {
  group(
    'parse the entire response',
    () {
      dynamic userContractsJson;
      int? numberOfContracts;

      setUpAll(
        () async {
          final metricsString = await File(
                  './assets/test_data/get-user-contract-metrics-with-contracts.json')
              .readAsString();
          userContractsJson = jsonDecode(metricsString);

          final contractsList = userContractsJson['contracts'] as List<dynamic>;
          numberOfContracts = contractsList.length;
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
    },
  );

  group(
    'specific cases',
    () {
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
    },
  );
}
