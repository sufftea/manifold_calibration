import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';

class BrierScoreService {
  double calculateBrierScore(List<Bet> bets) {
    var sum = 0.0;
    for (final bet in bets) {
      if (bet.outcome case BinaryBetOutcome(probAfter: final probAfter)) {
        switch (bet.market.outcome) {
          case BinaryYesMarketOutcome _:
            sum += pow(probAfter - 1, 2);
          case BinaryNoMarketOutcome _:
            sum += pow(probAfter, 2);
          default:
            continue;
        }
      }
    }

    return sum / bets.length;
  }
}

final brierScoreServiceProvider = Provider(
  (ref) {
    return BrierScoreService();
  },
);
