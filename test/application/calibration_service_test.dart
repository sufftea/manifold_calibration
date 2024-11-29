import 'package:flutter_test/flutter_test.dart';
import 'package:manifold_callibration/domain/calibration_service.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/bet_outcome.dart';
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
                  true => BinaryYesBetOutcome(probAfter: e.probAfter),
                  false => BinaryNoBetOutcome(probAfter: e.probAfter),
                },
                updatedTime: DateTime.now(),
                market: Market(
                  id: '1',
                  outcome: switch (e.resolution) {
                    true => BinaryYesMarketOutcome(),
                    false => BinaryNoMarketOutcome(),
                  },
                ),
                amount: 100,
              ),
            )
            .toList();

        final service = CalibrationService();
        final result = service.calculateCalibration(
          bets: bets,
          nofBuckets: 10,
          weighByMana: false,
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
                  true => BinaryYesBetOutcome(probAfter: e.probAfter),
                  false => BinaryNoBetOutcome(probAfter: e.probAfter),
                },
                updatedTime: DateTime.now(),
                market: Market(
                  id: '1',
                  outcome: switch (e.resolution) {
                    true => BinaryYesMarketOutcome(),
                    false => BinaryNoMarketOutcome(),
                  },
                ),
                amount: e.mana.toDouble(),
              ),
            )
            .toList();

        final service = CalibrationService();
        final result = service.calculateCalibration(
          bets: bets,
          nofBuckets: 3,
          weighByMana: false,
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
                  true => BinaryYesBetOutcome(probAfter: e.probAfter),
                  false => BinaryNoBetOutcome(probAfter: e.probAfter),
                },
                updatedTime: DateTime.now(),
                market: Market(
                  id: '1',
                  outcome: switch (e.resolution) {
                    true => BinaryYesMarketOutcome(),
                    false => BinaryNoMarketOutcome(),
                  },
                ),
                amount: e.mana.toDouble(),
              ),
            )
            .toList();

        final service = CalibrationService();
        final result = service.calculateCalibration(
          bets: bets,
          nofBuckets: 3,
          weighByMana: true,
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
            outcome: BinaryYesBetOutcome(probAfter: 0.5),
            updatedTime: DateTime.now(),
            market: Market(
              id: '1',
              outcome: null,
            ),
            amount: 100,
          ),
        ];

        final service = CalibrationService();
        final result = service.calculateCalibration(
          bets: bets,
          nofBuckets: 3,
          weighByMana: true,
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
                  true => BinaryYesBetOutcome(probAfter: e.probAfter),
                  false => BinaryNoBetOutcome(probAfter: e.probAfter),
                },
                updatedTime: DateTime.now(),
                market: Market(
                  id: '1',
                  outcome: switch (e.resolution) {
                    true => BinaryYesMarketOutcome(),
                    false => BinaryNoMarketOutcome(),
                  },
                ),
                amount: e.mana.toDouble(),
              ),
            )
            .toList();

        final service = CalibrationService();
        final result = service.calculateCalibration(
          bets: bets,
          nofBuckets: 0,
          weighByMana: true,
        );

        expect(result.isEmpty, equals(true));
      });
    },
  );
}
