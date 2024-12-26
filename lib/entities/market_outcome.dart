sealed class MarketOutcome {
  const MarketOutcome();
}

class UnimplementedMarketOutcome extends MarketOutcome {}

sealed class BinaryMarketOutcome extends MarketOutcome {
  const BinaryMarketOutcome();
}

class BinaryYesMarketOutcome extends BinaryMarketOutcome {}

class BinaryNoMarketOutcome extends BinaryMarketOutcome {}

class BinaryMktMarketOutcome extends BinaryMarketOutcome {
  final double probability;

  const BinaryMktMarketOutcome({required this.probability});
}

class MultipleChoiceMarketOutcome extends MarketOutcome {
  final List<MultipleChoiceAnswerOutcome> answerOutcomes;

  MultipleChoiceMarketOutcome({required this.answerOutcomes});
}

sealed class MultipleChoiceAnswerOutcome {
  final String answerId;

  MultipleChoiceAnswerOutcome(this.answerId);
}

class MultipleChoiceAnswerYesOutcome extends MultipleChoiceAnswerOutcome {
  MultipleChoiceAnswerYesOutcome(super.answerId);
}

class MultipleChoiceAnswerNoOutcome extends MultipleChoiceAnswerOutcome {
  MultipleChoiceAnswerNoOutcome(super.answerId);
}

class MultipleChoiceAnswerMktOutcome extends MultipleChoiceAnswerOutcome {
  final double probability;

  MultipleChoiceAnswerMktOutcome({
    required this.probability,
    required String answerId,
  }) : super(answerId);
}
