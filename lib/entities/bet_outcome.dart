sealed class BetOutcome {
  const BetOutcome();
}

sealed class BinaryBetOutcome extends BetOutcome {
  final double probAfter;

  const BinaryBetOutcome({required this.probAfter});
}

class BinaryBetOutcomeYes extends BinaryBetOutcome {
  BinaryBetOutcomeYes({required super.probAfter});
}

class BinaryBetOutcomeNo extends BinaryBetOutcome {
  BinaryBetOutcomeNo({required super.probAfter});
}

sealed class MultipleChoiceBetOutcome extends BetOutcome {
  final double probAfter;
  final String answerId;

  const MultipleChoiceBetOutcome(
      {required this.probAfter, required this.answerId});
}

class MultipleChoiceBetOutcomeYes extends MultipleChoiceBetOutcome {
  const MultipleChoiceBetOutcomeYes({
    required super.probAfter,
    required super.answerId,
  });
}

class MultipleChoiceBetOutcomeNo extends MultipleChoiceBetOutcome {
  const MultipleChoiceBetOutcomeNo({
    required super.probAfter,
    required super.answerId,
  });
}

class UnimplementedBetOutcome extends BetOutcome {}
