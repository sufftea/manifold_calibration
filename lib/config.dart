import 'package:flutter_riverpod/flutter_riverpod.dart';

class Config {
  final int marketRequestBatchSize;
  // Manifold returns at most this amount of bets in a single request.
  final int manifoldBetsPerRequestLimit;

  Config({
    required this.marketRequestBatchSize,
    required this.manifoldBetsPerRequestLimit,
  });
}

final configProvider = Provider(
  (ref) => Config(
    marketRequestBatchSize: 500,
    manifoldBetsPerRequestLimit: 10000,
  ),
);
