import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manifold_callibration/application/calibration_service.dart';
import 'package:manifold_callibration/data/bets_repository.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/outcome_bucket.dart';

class CalibrationController
    extends AutoDisposeFamilyAsyncNotifier<CalibrationState, String> {
  @override
  FutureOr<CalibrationState> build(String arg) async {
    final bets = await ref.watch(betsRepositoryProvider).getUserBets(arg);
    final buckets = ref
        .watch(calibrationServiceProvider)
        .calculateCalibration(bets: bets, buckets: 10);

    return CalibrationState(buckets: buckets, bets: bets);
  }

  void changeBuckets(int nofBuckets) {
    state.whenData(
      (value) {
        debugPrint('running changeBuckets');
        final buckets = ref
            .watch(calibrationServiceProvider)
            .calculateCalibration(bets: value.bets, buckets: nofBuckets);

        state = AsyncData(value.copyWith(buckets: buckets));
      },
    );
  }

  void refresh() async {
    state = const AsyncValue.loading();

    final bets = await ref.watch(betsRepositoryProvider).getUserBets(arg);
    final buckets = ref
        .watch(calibrationServiceProvider)
        .calculateCalibration(bets: bets, buckets: 10);

    state = AsyncData(CalibrationState(buckets: buckets, bets: bets));
  }
}

class CalibrationState {
  final List<OutcomeBucket> buckets;
  final List<Bet> bets;

  CalibrationState({
    required this.buckets,
    required this.bets,
  });

  CalibrationState copyWith({
    List<OutcomeBucket>? buckets,
    List<Bet>? bets,
  }) {
    return CalibrationState(
      buckets: buckets ?? this.buckets,
      bets: bets ?? this.bets,
    );
  }
}

final calibrationControllerProvider = AsyncNotifierProvider.autoDispose
    .family<CalibrationController, CalibrationState, String>(
  CalibrationController.new,
);
