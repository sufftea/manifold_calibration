sealed class MarketOutcome {
  const MarketOutcome();
}

sealed class BinaryMarketOutcome extends MarketOutcome {
  const BinaryMarketOutcome();
}

class BinaryYesMarketOutcome extends BinaryMarketOutcome {}

class BinaryNoMarketOutcome extends BinaryMarketOutcome {}

class BinaryMktMarketOutcome extends BinaryMarketOutcome {
  final double probability;

  const BinaryMktMarketOutcome({required this.probability});
}

class UnimplementedMarketOutcome extends MarketOutcome {}

class MultipleChoiceMarketOutcome extends MarketOutcome {}
