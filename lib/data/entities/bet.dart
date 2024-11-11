class Bet {
  final String id;
  final String outcome;
  final double probAfter;
  final int updatedTime;
  final String marketId;

  const Bet({
    required this.id,
    required this.outcome,
    required this.probAfter,
    required this.updatedTime,
    required this.marketId,
  });
}
