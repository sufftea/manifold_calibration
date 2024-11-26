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

      state = CalibrationStateData(
        buckets: buckets,
        bets: bets,
        username: username,
        nofResolvedMarkets: nofResolvedMarkets,
        brierScore: brierScore,
      );
    } on Exception catch (e, s) {
      state = CalibrationStateError(e, s);
      return;
    }
  }
}

sealed class CalibrationState {}

class CalibrationStateEmpty extends CalibrationState {}

class CalibrationStateLoading extends CalibrationState {}

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
  final int nofResolvedMarkets;

  CalibrationStateData({
    required this.brierScore,
    required this.username,
    required this.buckets,
    required this.bets,
    required this.nofResolvedMarkets,
  });

  CalibrationStateData copyWith({
    List<OutcomeBucket>? buckets,
    List<Bet>? bets,
    double? brierScore,
    String? username,
    int? nofResolvedMarkets,
  }) {
    return CalibrationStateData(
      brierScore: brierScore ?? this.brierScore,
      buckets: buckets ?? this.buckets,
      bets: bets ?? this.bets,
      username: username ?? this.username,
      nofResolvedMarkets: nofResolvedMarkets ?? this.nofResolvedMarkets,
    );
  }
}

final calibrationControllerProvider =
    NotifierProvider.autoDispose<CalibrationController, CalibrationState>(
  CalibrationController.new,
);
