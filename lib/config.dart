import 'package:flutter_riverpod/flutter_riverpod.dart';

class Config {
  // Manifold returns at most this amount of bets in a single request.
  final int manifoldBetsPerRequestLimit;
  final int manifoldMarketsPerREquestLimit;
  final String apiBaseUrl;

  Config({
    this.apiBaseUrl = 'https://api.manifold.markets',
    required this.manifoldBetsPerRequestLimit,
    required this.manifoldMarketsPerREquestLimit,
  });
}

final configProvider = Provider(
  (ref) => Config(
    manifoldMarketsPerREquestLimit: 10000,
    manifoldBetsPerRequestLimit: 10000,
  ),
);
