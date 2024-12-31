import 'package:manifold_callibration/entities/market_outcome.dart';

class Market {
  final String id;
  final MarketOutcome? outcome;
  Market({
    required this.id,
    required this.outcome,
  });
}
