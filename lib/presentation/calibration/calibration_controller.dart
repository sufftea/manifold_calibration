import 'dart:async';

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

  void setUsername(String username) async {
    if (state.isLoading) {
      return;
    }

    await _loadState(username);
  }

  void changeBuckets(int nofBuckets) {
    state.whenData(
      (value) {
        if (value is CalibrationStateData) {
          final buckets = ref
              .watch(calibrationServiceProvider)
              .calculateCalibration(bets: value.bets, nofBuckets: nofBuckets);

          state = AsyncData(value.copyWith(buckets: buckets));
        }
      },
    );
  }

  void refresh() async {
    if (state case AsyncData(value: CalibrationStateData data)) {
      await _loadState(data.username, data.buckets.length);
    }
  }

  Future<void> _loadState(String username, [int? nofBuckets]) async {
    state = AsyncLoading();

    final betsRepo = ref.read(betsRepositoryProvider);
    final calibrationService = ref.read(calibrationServiceProvider);

    final bets = await betsRepo.getUserBets(username);

    final buckets = calibrationService.calculateCalibration(
      bets: bets,
      nofBuckets: nofBuckets ?? 10,
    );
    final brierScore = calibrationService.calculateBrierScore(bets);
    final nofResolvedMarkets =
        bets.where((e) => e.market.outcome != null).length;

    if (state.valueOrNull case final value) {
      if (value is CalibrationStateData) {
        state = AsyncData(value.copyWith(
          username: username,
          buckets: buckets,
          bets: bets,
          nofResolvedBets: nofResolvedMarkets,
          brierScore: brierScore,
        ));
      } else {
        state = AsyncData(CalibrationStateData(
          buckets: buckets,
          bets: bets,
          username: username,
          nofResolvedBets: nofResolvedMarkets,
          brierScore: brierScore,
          weighByMana: false,
        ));
      }
    }
  }
}

sealed class CalibrationState {}

class CalibrationStateEmpty extends CalibrationState {}

class CalibrationStateData extends CalibrationState {
  final List<OutcomeBucket> buckets;
  final List<Bet> bets;
  final String username;
  final double brierScore;
  final int nofResolvedBets;
  final bool weighByMana;

  CalibrationStateData({
    required this.brierScore,
    required this.username,
    required this.buckets,
    required this.bets,
    required this.nofResolvedBets,
    required this.weighByMana,
  });

  CalibrationStateData copyWith({
    List<OutcomeBucket>? buckets,
    List<Bet>? bets,
    double? brierScore,
    String? username,
    int? nofResolvedBets,
    bool? weighByMana,
  }) {
    return CalibrationStateData(
      brierScore: brierScore ?? this.brierScore,
      buckets: buckets ?? this.buckets,
      bets: bets ?? this.bets,
      username: username ?? this.username,
      nofResolvedBets: nofResolvedBets ?? this.nofResolvedBets,
      weighByMana: weighByMana ?? this.weighByMana,
    );
  }
}

final calibrationControllerProvider =
    AsyncNotifierProvider.autoDispose<CalibrationController, CalibrationState>(
  CalibrationController.new,
);
