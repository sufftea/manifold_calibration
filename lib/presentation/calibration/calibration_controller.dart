import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manifold_callibration/data/bets_repository.dart';
import 'package:manifold_callibration/domain/calibration_service.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/outcome_bucket.dart';

class CalibrationController extends AutoDisposeAsyncNotifier<CalibrationState> {
  @override
  FutureOr<CalibrationState> build() async {
    return CalibrationStateEmpty();
  }

  void setParams({
    required String username,
    required int nofBuckets,
    required bool weighByMana,
    bool forceRefresh = false,
  }) async {
    // state = AsyncError(Exception('test exception'), StackTrace.fromString(''));

    if (state.isLoading) {
      return;
    }

    final List<Bet> bets;

    switch (state) {
      case AsyncData(value: CalibrationStateData data)
          when data.username == username && !forceRefresh:
        bets = data.bets;
      default:
        state = AsyncLoading();
        final betsRepo = ref.read(betsRepositoryProvider);

        try {
          bets = await betsRepo.getUserBets(username);
        } on Exception catch (e, s) {
          state = AsyncError(e, s);
          return;
        }
    }

    final stats = _calculateStats(
      bets: bets,
      nofBuckets: nofBuckets,
      weighByMana: weighByMana,
    );

    state = AsyncData(CalibrationStateData(
      username: username,
      bets: bets,
      stats: stats,
    ));
  }

  CalibrationStats _calculateStats({
    required List<Bet> bets,
    required int nofBuckets,
    required bool weighByMana,
  }) {
    final calibrationService = ref.read(calibrationServiceProvider);
    final buckets = calibrationService.calculateCalibration(
      bets: bets,
      nofBuckets: nofBuckets,
    );
    final brierScore = calibrationService.calculateBrierScore(bets);
    final nofResolvedBets = bets.where((e) => e.market.outcome != null).length;

    return CalibrationStats(
      buckets: buckets,
      brierScore: brierScore,
      nofResolvedBets: nofResolvedBets,
    );
  }
}

sealed class CalibrationState {}

class CalibrationStateEmpty extends CalibrationState {}

class CalibrationStateData extends CalibrationState {
  final List<Bet> bets;
  final String username;
  final CalibrationStats stats;

  CalibrationStateData({
    required this.username,
    required this.bets,
    required this.stats,
  });

  CalibrationStateData copyWith({
    List<Bet>? bets,
    String? username,
    CalibrationStats? stats,
  }) {
    return CalibrationStateData(
      bets: bets ?? this.bets,
      username: username ?? this.username,
      stats: stats ?? this.stats,
    );
  }
}

class CalibrationStats {
  final List<OutcomeBucket> buckets;
  final double brierScore;
  final int nofResolvedBets;

  CalibrationStats({
    required this.buckets,
    required this.brierScore,
    required this.nofResolvedBets,
  });
}

final calibrationControllerProvider =
    AsyncNotifierProvider.autoDispose<CalibrationController, CalibrationState>(
  CalibrationController.new,
);
