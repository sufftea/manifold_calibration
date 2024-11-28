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
    required bool weighByMana,
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
          weighByMana: weighByMana,
        ),
        noRatio: _calculateRatio(
          bucket.where((e) => e.outcome is BinaryNoBetOutcome),
          weighByMana: weighByMana,
        ),
      );
    }).toList();
  }

  double calculateBrierScore(List<Bet> bets) {
    var n = 0;

    var sum = 0.0;
    for (final bet in bets) {
      if (bet.amount < 0) {
        continue;
      }

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

  double _calculateRatio(Iterable<Bet> bets, {required bool weighByMana}) {
    if (bets.isEmpty) {
      return -1;
    }

    double total = 0;
    double positive = 0;

    for (final bet in bets) {
      if (bet.amount < 0) {
        continue;
      }

      final amount = weighByMana ? bet.amount : 1;

      if (bet.market.outcome != null) {
        total += amount;
      }
      if (bet.market.outcome is BinaryYesMarketOutcome) {
        positive += amount;
      }
    }

    if (total == 0) {
      return -1;
    }

    return positive / total;
  }
}

final calibrationServiceProvider = Provider((ref) => CalibrationService());
