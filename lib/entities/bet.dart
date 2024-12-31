import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/market.dart';

class Bet {
  final String id;
  final BetOutcome outcome;
  final DateTime updatedTime;

  /// Nullability is needed internally for convenient parsing. Should never be null.
  Market? market;
  final String marketId;
  final double amount;

  Bet({
    required this.id,
    required this.outcome,
    required this.updatedTime,
    required this.amount,
    required this.marketId,
    this.market,
  });
}
