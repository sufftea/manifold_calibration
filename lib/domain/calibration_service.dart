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

  double calculateBrierScore(List<Bet> bets) {
    var n = 0;

    var sum = 0.0;
    for (final bet in bets) {
      if (bet.amount < 0) {
        continue;
      }

      if (bet.outcome case BinaryBetOutcome(probAfter: final probAfter)) {
        switch (bet.market!.outcome) {
          case BinaryMarketOutcomeYes _:
            n++;
            sum += pow(probAfter - 1, 2);
          case BinaryMarketOutcomeNo _:
            n++;
            sum += pow(probAfter, 2);
          default:
          // continue;
        }
      }
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
