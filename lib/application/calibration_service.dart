import 'dart:math';

import 'package:flutter/foundation.dart';
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

    debugPrint('');

    return resolvedBetsBucketed
        .map((bucket) => OutcomeBucket(
              bets: bucket,
              yesRatio: _calculateRatio(
                bucket.where((e) => e.outcome is BinaryYesBetOutcome),
              ),
              noRatio: _calculateRatio(
                bucket.where((e) => e.outcome is BinaryNoBetOutcome),
              ),
            ))
        .toList();
  }

  double _calculateRatio(Iterable<Bet> bets) {
    if (bets.isEmpty) {
      return -1;
    }

    final correct = bets
        .where(
          (element) => element.isPredictionCorrect!,
        )
        .length;
    final incorrect = bets
        .where(
          (element) => !element.isPredictionCorrect!,
        )
        .length;

    return correct / (correct + incorrect);
  }
}

final calibrationServiceProvider = Provider((ref) => CalibrationService());
