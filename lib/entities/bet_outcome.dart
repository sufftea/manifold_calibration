// TODO: I should move the Yes/No part to the end of the name for readability

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

sealed class MultipleChoiceBetOutcome extends BetOutcome {
  final double probAfter;
  final String answerId;

  const MultipleChoiceBetOutcome(
      {required this.probAfter, required this.answerId});
}

class MultipleChoiceYesBetOutcome extends MultipleChoiceBetOutcome {
  const MultipleChoiceYesBetOutcome({
    required super.probAfter,
    required super.answerId,
  });
}

class MultipleChoiceNoBetOutcome extends MultipleChoiceBetOutcome {
  const MultipleChoiceNoBetOutcome({
    required super.probAfter,
    required super.answerId,
  });
}

class UnimplementedBetOutcome extends BetOutcome {}
