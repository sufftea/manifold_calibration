import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manifold_callibration/data/bets_repository.dart';
import 'package:manifold_callibration/domain/calibration_service.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/outcome_bucket.dart';

class CalibrationController extends AutoDisposeNotifier<CalibrationState> {
  @override
  CalibrationState build() {
    return CalibrationStateEmpty();
  }

  void setUsername(String username) async {
    if (state is CalibrationStateLoading) {
      return;
    }
    await _loadState(username);
  }

  void changeBuckets(int nofBuckets) {
    if (state case final CalibrationStateData value) {
      final buckets = ref
          .watch(calibrationServiceProvider)
          .calculateCalibration(bets: value.bets, nofBuckets: nofBuckets);

      state = value.copyWith(buckets: buckets);
    }
  }

  void refresh() async {
    if (state case final CalibrationStateData value) {
      await _loadState(value.username, value.buckets.length);
    }
  }

  Future<void> _loadState(String username, [int? nofBuckets]) async {
    try {
      final CalibrationStateData? data;
      if (state case final CalibrationStateData state) {
        data = state;
      } else {
        data = null;
      }

      state = CalibrationStateLoading();

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

      state = data?.copyWith(
            buckets: buckets,
            bets: bets,
            nofResolvedBets: nofResolvedMarkets,
            brierScore: brierScore,
          ) ??
          CalibrationStateData(
            buckets: buckets,
            bets: bets,
            username: username,
            nofResolvedBets: nofResolvedMarkets,
            brierScore: brierScore,
            weighByMana: false,
          );
    } on Exception catch (e, s) {
      state = CalibrationStateError(e, s);
      return;
    }
  }
}

sealed class CalibrationState {
  final CalibrationStateData? data;

  CalibrationState({this.data});
}

class CalibrationStateEmpty extends CalibrationState {
  CalibrationStateEmpty({super.data});
}

class CalibrationStateLoading extends CalibrationState {
  CalibrationStateLoading({super.data});
}

class CalibrationStateError extends CalibrationState {
  final Object err;
  final StackTrace stackTrace;
  CalibrationStateError(this.err, this.stackTrace);
}

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
    NotifierProvider.autoDispose<CalibrationController, CalibrationState>(
  CalibrationController.new,
);
