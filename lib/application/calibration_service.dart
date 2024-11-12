import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';
import 'package:manifold_callibration/entities/outcome_bucket.dart';

class CalibrationService {
  List<OutcomeBucket> calculateCalibration({
    required List<Bet> bets,
    required int buckets,
  }) {
    final resolvedBetsBucketed = <List<Bet>>[
      for (int i = 0; i < buckets; i++) [],
    ];
    for (final bet in bets) {
      if (bet.market.outcome is! BinaryMarketOutcome) {
        continue;
      }

      final betOutcome = bet.outcome;
      if (betOutcome is BinaryBetOutcome) {
        var bucket = (buckets * betOutcome.probAfter).floor();
        bucket = min(bucket, buckets - 1);

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
