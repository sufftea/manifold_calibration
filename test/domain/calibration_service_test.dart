import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/market.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';
import 'package:manifold_callibration/entities/outcome_bucket.dart';
// Import the helper class

class CalibrationService {
  List<OutcomeBucket> calculateCalibration({
    required List<Bet> bets,
    required int nofBuckets,
    required bool weighByMana,
    required bool excludeMultipleChoice,
  }) {
    if (nofBuckets <= 0) {
      return [];
    }

    final resolvedBetsBucketed = <List<Bet>>[
      for (int i = 0; i < nofBuckets; i++) [],
    ];

    for (final bet in bets) {
      final double betProbAfter;

      switch ((bet.outcome, bet.market!.outcome)) {
        case (final BinaryBetOutcome betOutcome, final BinaryMarketOutcome _):
          betProbAfter = betOutcome.probAfter;
        case (
            final MultipleChoiceBetOutcome betOutcome,
            final MultipleChoiceMarketOutcome _,
          ):
          betProbAfter = betOutcome.probAfter;
        default:
          continue;
      }

      var bucket = (nofBuckets * betProbAfter).floor();
      bucket = min(bucket, nofBuckets - 1);

      resolvedBetsBucketed[bucket].add(bet);
    }

    return resolvedBetsBucketed.map((bucket) {
      return OutcomeBucket(
        bets: bucket,
        yesRatio: _calculateFulfilledRatio(
          bucket
              .where((e) => switch (e.outcome) {
                    BinaryBetOutcomeYes _ => true,
                    MultipleChoiceBetOutcomeYes _ when !excludeMultipleChoice =>
                      true,
                    _ => false
                  })
              .toList(),
          weighByMana: weighByMana,
        ),
        noRatio: _calculateFulfilledRatio(
          bucket
              .where((e) => switch (e.outcome) {
                    BinaryBetOutcomeNo _ => true,
                    MultipleChoiceBetOutcomeNo _ when !excludeMultipleChoice =>
                      true,
                    _ => false
                  })
              .toList(),
          weighByMana: weighByMana,
        ),
      );
    }).toList();
  }

  double calculateBrierScore(
    List<Bet> bets, {
    required bool excludeMultipleChoice,
  }) {
    var n = 0;

    var sum = 0.0;
    for (final bet in bets) {
      if (bet.amount < 0) {
        continue;
      }

      switch ((bet.outcome, bet.market?.outcome)) {
        case (
            BinaryBetOutcome(probAfter: final probAfter),
            BinaryMarketOutcomeYes _,
          ):
          n++;
          sum += pow(probAfter - 1, 2);
        case (
            BinaryBetOutcome(probAfter: final probAfter),
            BinaryMarketOutcomeNo _,
          ):
          n++;
          sum += pow(probAfter, 2);
        case (
              MultipleChoiceBetOutcome(
                answerId: final answerId,
                probAfter: final probAfter,
              ),
              MultipleChoiceMarketOutcome(answerOutcomes: final answerOutcomes)
            )
            when !excludeMultipleChoice:
          final answer = answerOutcomes
              .where((answer) => answer.answerId == answerId)
              .firstOrNull;

          switch (answer) {
            case MultipleChoiceAnswerOutcomeYes _:
              n++;
              sum += pow(probAfter - 1, 2);
            case MultipleChoiceAnswerOutcomeNo _:
              n++;
              sum += pow(probAfter, 2);
            default:
          }
        default:
      }
    }

    if (n == 0) {
      return 0;
    }

    return sum / n;
  }

  

  double _calculateFulfilledRatio(
    Iterable<Bet> bets, {
    required bool weighByMana,
  }) {
    if (bets.isEmpty) {
      return -1;
    }

    double total = 0;
    double fulfilled = 0;

    for (final bet in bets) {
      if (bet.amount < 0) {
        continue;
      }

      final amount = weighByMana ? bet.amount : 1;

      switch ((bet.outcome, bet.market!.outcome)) {
        case (_, BinaryMarketOutcomeYes _):
          total += amount;
          fulfilled += amount;
        case (_, BinaryMarketOutcomeNo _):
          total += amount;
        case (
            MultipleChoiceBetOutcome betOutcome,
            MultipleChoiceMarketOutcome marketOutcome
          ):
          final answerOutcome = marketOutcome.answerOutcomes
              .where((answer) => answer.answerId == betOutcome.answerId)
              .firstOrNull;

          switch (answerOutcome) {
            case MultipleChoiceAnswerOutcomeYes _:
              total += amount;
              fulfilled += amount;
            case MultipleChoiceAnswerOutcomeNo _:
              total += amount;
            default:
          }

        default:
      }
    }

    if (total == 0) {
      return -1;
    }
    return fulfilled / total;
  }
}

final calibrationServiceProvider = Provider((ref) => CalibrationService());

void main() {
  group(
    'calculateCalibration',
    () {
      test('normal input', () async {
        final betsData = [
          // 0.9
          (bet: true, probBefore: 0.8, probAfter: 0.9, resolution: false),
          (bet: true, probBefore: 0.9, probAfter: 1.0, resolution: true),
          (bet: true, probBefore: 0.95, probAfter: 0.99, resolution: true),
          (bet: false, probBefore: 0.85, probAfter: 0.91, resolution: true),
          (bet: false, probBefore: 0.90, probAfter: 0.91, resolution: false),
          // 0.8
          (bet: true, probBefore: 0.75, probAfter: 0.81, resolution: true),
          (bet: true, probBefore: 0.80, probAfter: 0.81, resolution: true),
          (bet: false, probBefore: 0.85, probAfter: 0.89, resolution: false),
          (bet: false, probBefore: 0.88, probAfter: 0.89, resolution: true),
          // 0.0
          (bet: true, probBefore: 0.05, probAfter: 0.09, resolution: false),
          (bet: true, probBefore: 0.08, probAfter: 0.09, resolution: true),
          (bet: false, probBefore: 0.00, probAfter: 0.01, resolution: false),
          (bet: false, probBefore: 0.01, probAfter: 0.01, resolution: false),
        ];

        final bets = betsData
            .map(
              (e) => Bet(
                id: '1',
                outcome: switch (e.bet) {
                  true => BinaryBetOutcomeYes(probBefore: e.probBefore, probAfter: e.probAfter),
                  false => BinaryBetOutcomeNo(probBefore: e.probBefore, probAfter: e.probAfter),
                },
                updatedTime: DateTime.now(),
                market: Market(
                  id: '1',
                  outcome: switch (e.resolution) {
                    true => BinaryMarketOutcomeYes(),
                    false => BinaryMarketOutcomeNo(),
                  },
                ),
                amount: 100,
                marketId: '1',
              ),
            )
            .toList();

        final service = CalibrationService();
        final result = service.calculateCalibration(
          bets: bets,
          nofBuckets: 10,
          weighByMana: false,
          excludeMultipleChoice: true,
        );

        expect(
          result
              .map(
                (e) => e.yesRatio,
              )
              .toList(),
          [
            1 / 2,
            -1.0,
            -1.0,
            -1.0,
            -1.0,
            -1.0,
            -1.0,
            -1.0,
            2 / 2,
            2 / 3,
          ],
        );
        expect(
          result.map(
            (e) => e.noRatio,
          ),
          [
            1 / 4,
            -1,
            -1,
            -1,
            -1,
            -1,
            -1,
            -1,
            1 / 2,
            1 / 2,
          ],
        );
      });

      test('ignores sells (negative mana)', () async {
        final betsData = [
          // 0.9
          (bet: true, probBefore: 0.85, probAfter: 0.9, resolution: false, mana: 100),
          (bet: true, probBefore: 0.9, probAfter: 1.0, resolution: true, mana: -100),
          (bet: true, probBefore: 0.95, probAfter: 0.99, resolution: true, mana: -100),
          (bet: false, probBefore: 0.85, probAfter: 0.91, resolution: true, mana: -100),
          (bet: false, probBefore: 0.90, probAfter: 0.91, resolution: false, mana: -100),
          // 0.5
          (bet: true, probBefore: 0.45, probAfter: 0.51, resolution: true, mana: 100),
          (bet: true, probBefore: 0.48, probAfter: 0.51, resolution: true, mana: -100),
          (bet: false, probBefore: 0.55, probAfter: 0.59, resolution: false, mana: -100),
          (bet: false, probBefore: 0.58, probAfter: 0.59, resolution: true, mana: -100),
          // 0.0
          (bet: true, probBefore: 0.05, probAfter: 0.09, resolution: false, mana: -100),
          (bet: true, probBefore: 0.08, probAfter: 0.09, resolution: true, mana: 100),
          (bet: false, probBefore: 0.00, probAfter: 0.01, resolution: false, mana: -100),
          (bet: false, probBefore: 0.01, probAfter: 0.01, resolution: false, mana: -100),
          (bet: false, probBefore: 0.01, probAfter: 0.01, resolution: false, mana: -100),
          (bet: false, probBefore: 0.01, probAfter: 0.01, resolution: true, mana: 100),
        ];

        final bets = betsData
            .map(
              (e) => Bet(
                id: '1',
                outcome: switch (e.bet) {
                  true => BinaryBetOutcomeYes(probBefore: e.probBefore, probAfter: e.probAfter),
                  false => BinaryBetOutcomeNo(probBefore: e.probBefore, probAfter: e.probAfter),
                },
                updatedTime: DateTime.now(),
                market: Market(
                  id: '1',
                  outcome: switch (e.resolution) {
                    true => BinaryMarketOutcomeYes(),
                    false => BinaryMarketOutcomeNo(),
                  },
                ),
                amount: e.mana.toDouble(),
                marketId: '1',
              ),
            )
            .toList();

        final service = CalibrationService();
        final result = service.calculateCalibration(
          bets: bets,
          nofBuckets: 3,
          weighByMana: false,
          excludeMultipleChoice: true,
        );

        expect(
          result.map((e) => e.yesRatio).toList(),
          [
            1.0,
            1.0,
            0.0,
          ],
        );
        expect(
          result.map(
            (e) => e.noRatio,
          ),
          [
            1.0,
            -1.0,
            -1.0,
          ],
        );
      });

      test('weigh by mana', () async {
        final betsData = [
          // 0.9
          (bet: true, probBefore: 0.85, probAfter: 0.9, resolution: true, mana: 1000),
          (bet: true, probBefore: 0.85, probAfter: 0.9, resolution: false, mana: 100),
          // 0.5
          (bet: true, probBefore: 0.45, probAfter: 0.51, resolution: true, mana: 100),
          (bet: true, probBefore: 0.45, probAfter: 0.51, resolution: false, mana: 1000),
          // 0.0
          (bet: false, probBefore: 0.09, probAfter: 0.09, resolution: true, mana: 100),
          (bet: false, probBefore: 0.01, probAfter: 0.01, resolution: false, mana: 1000),
        ];

        final bets = betsData
            .map(
              (e) => Bet(
                id: '1',
                outcome: switch (e.bet) {
                  true => BinaryBetOutcomeYes(probBefore: e.probBefore, probAfter: e.probAfter),
                  false => BinaryBetOutcomeNo(probBefore: e.probBefore, probAfter: e.probAfter),
                },
                updatedTime: DateTime.now(),
                market: Market(
                  id: '1',
                  outcome: switch (e.resolution) {
                    true => BinaryMarketOutcomeYes(),
                    false => BinaryMarketOutcomeNo(),
                  },
                ),
                amount: e.mana.toDouble(),
                marketId: '1',
              ),
            )
            .toList();

        final service = CalibrationService();
        final result = service.calculateCalibration(
          bets: bets,
          nofBuckets: 3,
          weighByMana: true,
          excludeMultipleChoice: true,
        );

        expect(
          result.map((e) => e.yesRatio).toList(),
          [
            -1.0,
            100 / 1100,
            1000 / 1100,
          ],
        );
        expect(
          result.map(
            (e) => e.noRatio,
          ),
          [
            100 / 1100,
            -1.0,
            -1.0,
          ],
        );
      });

      test('ignores unresolved bets', () async {
        final bets = <Bet>[
          Bet(
            id: '1',
            outcome: BinaryBetOutcomeYes(probBefore: 0.4, probAfter: 0.5), // Add probBefore
            updatedTime: DateTime.now(),
            market: Market(
              id: '1',
              outcome: null,
            ),
            amount: 100,
            marketId: '1',
          ),
        ];

        final service = CalibrationService();
        final result = service.calculateCalibration(
          bets: bets,
          nofBuckets: 3,
          weighByMana: true,
          excludeMultipleChoice: true,
        );

        expect(
          result.map((e) => e.yesRatio).toList(),
          [
            -1.0,
            -1.0,
            -1.0,
          ],
        );
        expect(
          result.map(
            (e) => e.noRatio,
          ),
          [
            -1.0,
            -1.0,
            -1.0,
          ],
        );
      });

      test('0 buckets', () async {
        final betsData = [
          // 0.9
          (bet: true, probBefore: 0.85, probAfter: 0.9, resolution: true, mana: 1000),
          (bet: true, probBefore: 0.85, probAfter: 0.9, resolution: false, mana: 100),
          // 0.5
          (bet: true, probBefore: 0.45, probAfter: 0.51, resolution: true, mana: 100),
          (bet: true, probBefore: 0.45, probAfter: 0.51, resolution: false, mana: 1000),
          // 0.0
          (bet: false, probBefore: 0.09, probAfter: 0.09, resolution: true, mana: 100),
          (bet: false, probBefore: 0.01, probAfter: 0.01, resolution: false, mana: 1000),
        ];

        final bets = betsData
            .map(
              (e) => Bet(
                id: '1',
                outcome: switch (e.bet) {
                  true => BinaryBetOutcomeYes(probBefore: e.probBefore, probAfter: e.probAfter),
                  false => BinaryBetOutcomeNo(probBefore: e.probBefore, probAfter: e.probAfter),
                },
                updatedTime: DateTime.now(),
                market: Market(
                  id: '1',
                  outcome: switch (e.resolution) {
                    true => BinaryMarketOutcomeYes(),
                    false => BinaryMarketOutcomeNo(),
                  },
                ),
                amount: e.mana.toDouble(),
                marketId: '1',
              ),
            )
            .toList();

        final service = CalibrationService();
        final result = service.calculateCalibration(
          bets: bets,
          nofBuckets: 0,
          weighByMana: true,
          excludeMultipleChoice: true,
        );

        expect(result, isEmpty);
      });

      test('includes multiple-choice bets', () async {
        final market = Market(
          id: 'market1',
          outcome: MultipleChoiceMarketOutcome(answerOutcomes: [
            MultipleChoiceAnswerOutcomeYes('yes1'),
            MultipleChoiceAnswerOutcomeYes('yes2'),
            MultipleChoiceAnswerOutcomeYes('yes3'),
            MultipleChoiceAnswerOutcomeYes('yes4'),
            MultipleChoiceAnswerOutcomeNo('no1'),
            MultipleChoiceAnswerOutcomeNo('no2'),
            MultipleChoiceAnswerOutcomeNo('no3'),
            MultipleChoiceAnswerOutcomeNo('no4'),
          ]),
        );

        final betsData = [
          // 0.9
          (bet: true, probBefore: 0.85, probAfter: 0.9, mana: 1000, answerId: 'yes1'),
          (bet: true, probBefore: 0.85, probAfter: 0.9, mana: 100, answerId: 'yes2'),
          // 0.5
          (bet: true, probBefore: 0.45, probAfter: 0.51, mana: 1000, answerId: 'yes3'),
          (bet: true, probBefore: 0.45, probAfter: 0.51, mana: 1000, answerId: 'no1'),
          (bet: false, probBefore: 0.45, probAfter: 0.51, mana: 100, answerId: 'no2'),
          (bet: false, probBefore: 0.45, probAfter: 0.51, mana: 1000, answerId: 'no3'),
          // 0.0
          (bet: false, probBefore: 0.09, probAfter: 0.09, mana: 100, answerId: 'no4'),
          (bet: false, probBefore: 0.01, probAfter: 0.01, mana: 1000, answerId: 'yes4'),
        ];

        final bets = [
          for (final betData in betsData)
            Bet(
              id: 'id',
              outcome: switch (betData.bet) {
                true => MultipleChoiceBetOutcomeYes(
                    probBefore: betData.probBefore,
                    probAfter: betData.probAfter,
                    answerId: betData.answerId,
                  ),
                false => MultipleChoiceBetOutcomeNo(
                    probBefore: betData.probBefore,
                    probAfter: betData.probAfter,
                    answerId: betData.answerId,
                  ),
              },
              updatedTime: DateTime.now(),
              amount: betData.mana.toDouble(),
              marketId: 'market1',
              market: market,
            )
        ];

        final service = CalibrationService();
        final result = service.calculateCalibration(
          bets: bets,
          nofBuckets: 3,
          weighByMana: false,
          excludeMultipleChoice: false,
        );

        expect(
          result.map((e) => e.yesRatio),
          [-1, 0.5, 1],
        );
        expect(
          result.map((e) => e.noRatio),
          [
            0.5,
            0,
            -1,
          ],
        );
      });
    },
  );

  group(
    'brier score',
    () {
      final binaryBetsData = [
        // 0.9
        (bet: true, probBefore: 0.8, probAfter: 0.9, resolution: true, mana: 1000),
        (bet: true, probBefore: 0.85, probAfter: 0.9, resolution: true, mana: 100),
        // 0.5
        (bet: true, probBefore: 0.45, probAfter: 0.50, resolution: true, mana: 100),
        (bet: true, probBefore: 0.48, probAfter: 0.50, resolution: false, mana: 1000),
        // 0.0
        (bet: false, probBefore: 0.05, probAfter: 0.1, resolution: false, mana: 100),
        (bet: false, probBefore: 0.08, probAfter: 0.1, resolution: false, mana: 1000),
        (bet: true, probBefore: 0.05, probAfter: 0.1, resolution: false, mana: 100),
        (bet: true, probBefore: 0.08, probAfter: 0.1, resolution: true, mana: 100),
      ];

      //
      final binaryBets = binaryBetsData
          .map(
            (e) => Bet(
              id: '1',
              outcome: switch (e.bet) {
                true => BinaryBetOutcomeYes(probBefore: e.probBefore, probAfter: e.probAfter),
                false => BinaryBetOutcomeNo(probBefore: e.probBefore, probAfter: e.probAfter),
              },
              updatedTime: DateTime.now(),
              market: Market(
                id: '1',
                outcome: switch (e.resolution) {
                  true => BinaryMarketOutcomeYes(),
                  false => BinaryMarketOutcomeNo(),
                },
              ),
              amount: e.mana.toDouble(),
              marketId: '1',
            ),
          )
          .toList();

      final multipleChoiceMarket1 = Market(
        id: 'market1',
        outcome: MultipleChoiceMarketOutcome(answerOutcomes: [
          MultipleChoiceAnswerOutcomeYes('yes1'),
          MultipleChoiceAnswerOutcomeYes('yes2'),
          MultipleChoiceAnswerOutcomeNo('no1'),
          MultipleChoiceAnswerOutcomeNo('no2'),
        ]),
      );
      final multipleChoiceMarket2 = Market(
        id: 'market1',
        outcome: MultipleChoiceMarketOutcome(answerOutcomes: [
          MultipleChoiceAnswerOutcomeYes('_yes1'),
          MultipleChoiceAnswerOutcomeYes('_yes2'),
          MultipleChoiceAnswerOutcomeNo('_no1'),
          MultipleChoiceAnswerOutcomeNo('_no2'),
        ]),
      );

      final multipleChoiceBets1Data = [
        (bet: true, probBefore: 0.8, probAfter: 0.9, mana: 1000, answerId: 'yes1'),
        (bet: true, probBefore: 0.85, probAfter: 0.9, mana: 100, answerId: 'yes2'),
        (bet: true, probBefore: 0.45, probAfter: 0.50, mana: 1000, answerId: 'no1'),
        (bet: false, probBefore: 0.48, probAfter: 0.50, mana: 100, answerId: 'no2'),
      ];
      final multipleChoiceBets2Data = [
        (bet: true, probBefore: 0.8, probAfter: 0.9, mana: 1000, answerId: '_no1'),
        (bet: true, probBefore: 0.85, probAfter: 0.9, mana: 100, answerId: '_yes2'),
        (bet: true, probBefore: 0.45, probAfter: 0.50, mana: 1000, answerId: '_yes1'),
        (bet: false, probBefore: 0.48, probAfter: 0.50, mana: 100, answerId: '_no2'),
      ];

      final multipleChoiceBets = [
        for (final betData in multipleChoiceBets2Data)
          Bet(
            id: 'id',
            outcome: switch (betData.bet) {
              true => MultipleChoiceBetOutcomeYes(
                  probBefore: betData.probBefore, // Add probBefore
                  probAfter: betData.probAfter,
                  answerId: betData.answerId,
                ),
              false => MultipleChoiceBetOutcomeNo(
                  probBefore: betData.probBefore, // Add probBefore
                  probAfter: betData.probAfter,
                  answerId: betData.answerId,
                ),
            },
            updatedTime: DateTime.now(),
            amount: betData.mana.toDouble(),
            marketId: 'market1',
            market: multipleChoiceMarket2,
          ),
        for (final betData in multipleChoiceBets1Data)
          Bet(
            id: 'id',
            outcome: switch (betData.bet) {
              true => MultipleChoiceBetOutcomeYes(
                  probBefore: betData.probBefore, // Add probBefore
                  probAfter: betData.probAfter,
                  answerId: betData.answerId,
                ),
              false => MultipleChoiceBetOutcomeNo(
                  probBefore: betData.probBefore, // Add probBefore
                  probAfter: betData.probAfter,
                  answerId: betData.answerId,
                ),
            },
            updatedTime: DateTime.now(),
            amount: betData.mana.toDouble(),
            marketId: 'market1',
            market: multipleChoiceMarket1,
          )
      ];

      test(
        'calculate brier score without multiple-choice bets',
        () {
          final service = CalibrationService();
          final result = service.calculateBrierScore(
            binaryBets,
            excludeMultipleChoice: true,
          );

          expect(result, moreOrLessEquals(0.17));
        },
      );
      test(
        'if bets.length == 0, must return 0',
        () {
          final service = CalibrationService();
          final result = service.calculateBrierScore(
            [], 
            excludeMultipleChoice: true,
          );

          expect(result, equals(0));
        },
      );
      test(
        'calculate brier score with multiple-choice bets',
        () {
          final service = CalibrationService();
          final result = service.calculateBrierScore(
            multipleChoiceBets,
            excludeMultipleChoice: false,
          );

          expect(result, moreOrLessEquals(0.23));
        },
      );
      test(
        'binary and multiple-choice bets at once',
        () {
          final service = CalibrationService();
          final result = service.calculateBrierScore(
            multipleChoiceBets + binaryBets,
            excludeMultipleChoice: false,
          );

          expect(result, moreOrLessEquals(0.2));
        },
      );
    },
  );
}