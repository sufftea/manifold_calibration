import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';
import 'package:manifold_callibration/entities/outcome_bucket.dart';

class CalibrationService {
  List<OutcomeBucket> calculateCalibration({
    required List<Bet> bets,
    required int nofBuckets,
  }) {
    final resolvedBetsBucketed = <List<Bet>>[
      for (int i = 0; i < nofBuckets; i++) [],
    ];
    for (final bet in bets) {
      if (bet.market.outcome is! BinaryMarketOutcome) {
        continue;
      }

      final betOutcome = bet.outcome;
      if (betOutcome is BinaryBetOutcome) {
        var bucket = (nofBuckets * betOutcome.probAfter).floor();
        bucket = min(bucket, nofBuckets - 1);

        resolvedBetsBucketed[bucket].add(bet);
      }
    }

    return resolvedBetsBucketed.map((bucket) {
      return OutcomeBucket(
        bets: bucket,
        yesRatio: _calculateRatio(
          bucket.where((e) => e.outcome is BinaryYesBetOutcome),
        ),
        noRatio: _calculateRatio(
          bucket.where((e) => e.outcome is BinaryNoBetOutcome),
        ),
      );
    }).toList();
  }

  double calculateBrierScore(List<Bet> bets) {
    var n = 0;

    var sum = 0.0;
    for (final bet in bets) {
      if (bet.outcome case BinaryBetOutcome(probAfter: final probAfter)) {
        switch (bet.market.outcome) {
          case BinaryYesMarketOutcome _:
            n++;
            sum += pow(probAfter - 1, 2);
          case BinaryNoMarketOutcome _:
            n++;
            sum += pow(probAfter, 2);
          default:
            continue;
        }
      }
    }

    return sum / n;
  }

  double calculateStandardError(List<Bet> bets, double brierScore) {
    // only count resolved markets
    final n = bets
        .where((element) => element.market.outcome is BinaryMarketOutcome)
        .length;
    return sqrt((brierScore * (1 - brierScore) / n));
  }

  double _calculateRatio(Iterable<Bet> bets) {
    if (bets.isEmpty) {
      return -1;
    }

    int positive = 0;
    for (final bet in bets) {
      switch (bet.market.outcome) {
        case BinaryYesMarketOutcome _:
          positive++;
        default:
      }
    }

    return positive / bets.length;
  }
}

final calibrationServiceProvider = Provider((ref) => CalibrationService());
