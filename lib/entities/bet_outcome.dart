sealed class BetOutcome {
  const BetOutcome();
}

class BinaryBetOutcome extends BetOutcome {
  final double probBefore;
  final double probAfter;

  BinaryBetOutcome({
    required this.probBefore,
    required this.probAfter,
  });
}

class BinaryBetOutcomeYes extends BinaryBetOutcome {
  BinaryBetOutcomeYes({
    required super.probBefore,
    required super.probAfter,
  });
}

class BinaryBetOutcomeNo extends BinaryBetOutcome {
  BinaryBetOutcomeNo({
    required super.probBefore,
    required super.probAfter,
  });
}

class MultipleChoiceBetOutcome extends BetOutcome {
  final String answerId;
  final double probBefore;
  final double probAfter;

  MultipleChoiceBetOutcome({
    required this.answerId,
    required this.probBefore,
    required this.probAfter,
  });
}

class MultipleChoiceBetOutcomeYes extends MultipleChoiceBetOutcome {
  MultipleChoiceBetOutcomeYes({
    required super.answerId,
    required super.probBefore,
    required super.probAfter,
  });
}

class MultipleChoiceBetOutcomeNo extends MultipleChoiceBetOutcome {
  MultipleChoiceBetOutcomeNo({
    required super.answerId,
    required super.probBefore,
    required super.probAfter,
  });
}

class UnimplementedBetOutcome extends BetOutcome {}
