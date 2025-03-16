import 'dart:math';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';

class MarketBaselineCalculator {
  static double calculate(
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
            BinaryBetOutcome(probBefore: final probBefore),
            BinaryMarketOutcomeYes _,
          ):
          n++;
          sum += pow(probBefore - 1, 2);
        case (
            BinaryBetOutcome(probBefore: final probBefore),
            BinaryMarketOutcomeNo _,
          ):
          n++;
          sum += pow(probBefore, 2);
        case (
              MultipleChoiceBetOutcome(
                answerId: final answerId,
                probBefore: final probBefore,
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
              sum += pow(probBefore - 1, 2);
            case MultipleChoiceAnswerOutcomeNo _:
              n++;
              sum += pow(probBefore, 2);
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
}