import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manifold_callibration/data/bets_repository.dart';
import 'package:manifold_callibration/entities/bet.dart';

class BetsService extends AsyncNotifier<BetsState> {
  final String username;

  BetsService({required this.username});

  void getCallibration() {}

  @override
  FutureOr<BetsState> build() async {
    final betsRepository = ref.read(betsRepositoryProvider);
    final bets = await betsRepository.getUserBets(username);

    return BetsState(bets: bets);
  }
}

class BetsState {
  final List<Bet> bets;

  BetsState({required this.bets});
}

final betsServiceProvider = Provider.family<BetsService, String>(
  (ref, arg) {
    return BetsService(username: arg);
  },
);
