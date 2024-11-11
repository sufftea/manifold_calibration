sealed class BetOutcome {}

class BinaryYesBetOutcome extends BetOutcome {
  final double probAfter;

  BinaryYesBetOutcome({required this.probAfter});
}

class BinaryNoBetOutcome extends BetOutcome {
  final double probAfter;

  BinaryNoBetOutcome({required this.probAfter});
}

class UnimplementedBetOutcome extends BetOutcome {}
