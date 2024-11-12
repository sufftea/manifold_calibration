import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';

class Bet {
  final String id;
  final BetOutcome outcome;
  final DateTime updatedTime;
  final Market market;

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
