sealed class BetOutcome {
  const BetOutcome();
}

sealed class BinaryBetOutcome extends BetOutcome {
  final double probAfter;

  const BinaryBetOutcome({required this.probAfter});
}

class BinaryYesBetOutcome extends BinaryBetOutcome {
  BinaryYesBetOutcome({required super.probAfter});
}

class BinaryNoBetOutcome extends BinaryBetOutcome {
  BinaryNoBetOutcome({required super.probAfter});
}

class UnimplementedBetOutcome extends BetOutcome {}
