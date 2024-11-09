import 'package:manifold_callibration/data/entities/market.dart';

class Bet {
  final String id;
  final String outcome;
  final double probAfter;
  final int updatedTime;
  final Market market;

  const Bet({
    required this.id,
    required this.outcome,
    required this.probAfter,
    required this.updatedTime,
    required this.market,
  });
}
