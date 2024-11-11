sealed class MarketOutcome {
  const MarketOutcome();
}

class BinaryYesMarketOutcome extends MarketOutcome {}

class BinaryNoMarketOutcome extends MarketOutcome {}

class BinaryMktMarketOutcome extends MarketOutcome {
  final double probability;

  const BinaryMktMarketOutcome({required this.probability});
}

class UnimplementedMarketOutcome extends MarketOutcome {}
