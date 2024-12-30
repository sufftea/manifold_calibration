import 'package:flutter_test/flutter_test.dart';
import 'package:manifold_callibration/domain/calibration_service.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/market.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';

void main() {
  group(
    'calculateCalibration',
    () {
      test('normal input', () async {
        final betsData = [
          // 0.9
          (bet: true, probAfter: 0.9, resolution: false),
          (bet: true, probAfter: 1.0, resolution: true),
          (bet: true, probAfter: 0.99, resolution: true),
          (bet: false, probAfter: 0.91, resolution: true),
          (bet: false, probAfter: 0.91, resolution: false),
          // 0.8
          (bet: true, probAfter: 0.81, resolution: true),
          (bet: true, probAfter: 0.81, resolution: true),
          (bet: false, probAfter: 0.89, resolution: false),
          (bet: false, probAfter: 0.89, resolution: true),
          // 0.0
          (bet: true, probAfter: 0.09, resolution: false),
          (bet: true, probAfter: 0.09, resolution: true),
          (bet: false, probAfter: 0.01, resolution: false),
          (bet: false, probAfter: 0.01, resolution: false),
          (bet: false, probAfter: 0.01, resolution: false),
          (bet: false, probAfter: 0.01, resolution: true),
        ];

        final bets = betsData
            .map(
              (e) => Bet(
                id: '1',
                outcome: switch (e.bet) {
                  true => BinaryBetOutcomeYes(probAfter: e.probAfter),
                  false => BinaryBetOutcomeNo(probAfter: e.probAfter),
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
          includeMultipleChoice: false,
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
          (bet: true, probAfter: 0.9, resolution: false, mana: 100),
          (bet: true, probAfter: 1.0, resolution: true, mana: -100),
          (bet: true, probAfter: 0.99, resolution: true, mana: -100),
          (bet: false, probAfter: 0.91, resolution: true, mana: -100),
          (bet: false, probAfter: 0.91, resolution: false, mana: -100),
          // 0.5
          (bet: true, probAfter: 0.51, resolution: true, mana: 100),
          (bet: true, probAfter: 0.51, resolution: true, mana: -100),
          (bet: false, probAfter: 0.59, resolution: false, mana: -100),
          (bet: false, probAfter: 0.59, resolution: true, mana: -100),
          // 0.0
          (bet: true, probAfter: 0.09, resolution: false, mana: -100),
          (bet: true, probAfter: 0.09, resolution: true, mana: 100),
          (bet: false, probAfter: 0.01, resolution: false, mana: -100),
          (bet: false, probAfter: 0.01, resolution: false, mana: -100),
          (bet: false, probAfter: 0.01, resolution: false, mana: -100),
          (bet: false, probAfter: 0.01, resolution: true, mana: 100),
        ];

        final bets = betsData
            .map(
              (e) => Bet(
                id: '1',
                outcome: switch (e.bet) {
                  true => BinaryBetOutcomeYes(probAfter: e.probAfter),
                  false => BinaryBetOutcomeNo(probAfter: e.probAfter),
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
          includeMultipleChoice: false,
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
          (bet: true, probAfter: 0.9, resolution: true, mana: 1000),
          (bet: true, probAfter: 0.9, resolution: false, mana: 100),
          // 0.5
          (bet: true, probAfter: 0.51, resolution: true, mana: 100),
          (bet: true, probAfter: 0.51, resolution: false, mana: 1000),
          // 0.0
          (bet: false, probAfter: 0.09, resolution: true, mana: 100),
          (bet: false, probAfter: 0.01, resolution: false, mana: 1000),
        ];

        final bets = betsData
            .map(
              (e) => Bet(
                id: '1',
                outcome: switch (e.bet) {
                  true => BinaryBetOutcomeYes(probAfter: e.probAfter),
                  false => BinaryBetOutcomeNo(probAfter: e.probAfter),
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
          includeMultipleChoice: false,
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
            outcome: BinaryBetOutcomeYes(probAfter: 0.5),
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
          includeMultipleChoice: false,
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
          (bet: true, probAfter: 0.9, resolution: true, mana: 1000),
          (bet: true, probAfter: 0.9, resolution: false, mana: 100),
          // 0.5
          (bet: true, probAfter: 0.51, resolution: true, mana: 100),
          (bet: true, probAfter: 0.51, resolution: false, mana: 1000),
          // 0.0
          (bet: false, probAfter: 0.09, resolution: true, mana: 100),
          (bet: false, probAfter: 0.01, resolution: false, mana: 1000),
        ];

        final bets = betsData
            .map(
              (e) => Bet(
                id: '1',
                outcome: switch (e.bet) {
                  true => BinaryBetOutcomeYes(probAfter: e.probAfter),
                  false => BinaryBetOutcomeNo(probAfter: e.probAfter),
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
          includeMultipleChoice: false,
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
          (bet: true, probAfter: 0.9, mana: 1000, answerId: 'yes1'),
          (bet: true, probAfter: 0.9, mana: 100, answerId: 'yes2'),
          // 0.5
          (bet: true, probAfter: 0.51, mana: 100, answerId: 'yes3'),
          (bet: true, probAfter: 0.51, mana: 1000, answerId: 'no1'),
          (bet: false, probAfter: 0.51, mana: 100, answerId: 'no2'),
          (bet: false, probAfter: 0.51, mana: 1000, answerId: 'no3'),
          // 0.0
          (bet: false, probAfter: 0.09, mana: 100, answerId: 'no4'),
          (bet: false, probAfter: 0.01, mana: 1000, answerId: 'yes4'),
        ];

        final bets = [
          for (final betData in betsData)
            Bet(
              id: 'id',
              outcome: switch (betData.bet) {
                true => MultipleChoiceBetOutcomeYes(
                    probAfter: betData.probAfter,
                    answerId: betData.answerId,
                  ),
                false => MultipleChoiceBetOutcomeNo(
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
          includeMultipleChoice: true,
        );

        expect(
          result.map((e) => e.yesRatio),
          [
            -1,
            0.5,
            1,
          ],
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
}
