sealed class MarketOutcome {
  const MarketOutcome();
}

class UnimplementedMarketOutcome extends MarketOutcome {}

sealed class BinaryMarketOutcome extends MarketOutcome {
  const BinaryMarketOutcome();
}

class BinaryMarketOutcomeYes extends BinaryMarketOutcome {}

class BinaryMarketOutcomeNo extends BinaryMarketOutcome {}

class BinaryMarketOutcomeMkt extends BinaryMarketOutcome {
  final double probability;

  const BinaryMarketOutcomeMkt({required this.probability});
}

class MultipleChoiceMarketOutcome extends MarketOutcome {
  final List<MultipleChoiceAnswerOutcome> answerOutcomes;

  MultipleChoiceMarketOutcome({required this.answerOutcomes});
}

sealed class MultipleChoiceAnswerOutcome {
  final String answerId;

  MultipleChoiceAnswerOutcome(this.answerId);
}

class MultipleChoiceAnswerOutcomeYes extends MultipleChoiceAnswerOutcome {
  MultipleChoiceAnswerOutcomeYes(super.answerId);
}

class MultipleChoiceAnswerOutcomeNo extends MultipleChoiceAnswerOutcome {
  MultipleChoiceAnswerOutcomeNo(super.answerId);
}

class MultipleChoiceAnswerOutcomeMkt extends MultipleChoiceAnswerOutcome {
  final double probability;

  MultipleChoiceAnswerOutcomeMkt({
    required this.probability,
    required String answerId,
  }) : super(answerId);
}
