class Market {
  final String id;
  final String outcomeType;
  final bool isResolved;
  final String? resolution;
  final double? resolutionProbability;

  Market({
    required this.id,
    required this.outcomeType,
    required this.isResolved,
    required this.resolution,
    required this.resolutionProbability,
  });
}
