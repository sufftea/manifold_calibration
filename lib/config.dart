import 'package:flutter_riverpod/flutter_riverpod.dart';

class Config {
  // Manifold returns at most this amount of bets in a single request.
  final int manifoldBetsPerRequestLimit;
  final String apiBaseUrl;

  Config({
    this.apiBaseUrl = 'https://api.manifold.markets',
    required this.manifoldBetsPerRequestLimit,
  });
}

final configProvider = Provider(
  (ref) => Config(
    manifoldBetsPerRequestLimit: 10000,
  ),
);
