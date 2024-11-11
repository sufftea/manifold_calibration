import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';

class Bet {
  final String id;
  final BetOutcome outcome;
  final DateTime updatedTime;
  final Market market;

  bool? get isPredictionCorrect {
    if (market.outcome is! BinaryMarketOutcome) {
      return null;
    }
    switch (outcome) {
      case BinaryYesBetOutcome _:
        return market.outcome is BinaryYesMarketOutcome;
      case BinaryNoBetOutcome _:
        return market.outcome is BinaryNoMarketOutcome;
      default:
        return null;
    }
  }

  const Bet({
    required this.id,
    required this.outcome,
    required this.updatedTime,
    required this.market,
  });
}

class Market {
  final String id;
  final MarketOutcome? outcome;
  Market({
    required this.id,
    required this.outcome,
  });
}
