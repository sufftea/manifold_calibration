import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manifold_callibration/application/calibration_service.dart';
import 'package:manifold_callibration/data/bets_repository.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';
import 'package:manifold_callibration/entities/outcome_bucket.dart';

class CalibrationController extends AutoDisposeAsyncNotifier<CalibrationState> {
  @override
  FutureOr<CalibrationState> build() async {
    return CalibrationStateEmpty();
  }

  void setUsername(String username) async {
    _loadState(username);
  }

  void changeBuckets(int nofBuckets) {
    state.whenData(
      (value) {
        if (value is CalibrationStateLoaded) {
          final buckets = ref
              .watch(calibrationServiceProvider)
              .calculateCalibration(bets: value.bets, buckets: nofBuckets);

          state = AsyncData(value.copyWith(buckets: buckets));
        }
      },
    );
  }

  void refresh() async {
    state.whenData(
      (value) async {
        if (value is CalibrationStateLoaded) {
          await _loadState(value.username);
        }
      },
    );
  }

  Future<void> _loadState(String username) async {
    state = const AsyncValue.loading();

    final bets = await ref.watch(betsRepositoryProvider).getUserBets(username);
    final buckets = ref
        .watch(calibrationServiceProvider)
        .calculateCalibration(bets: bets, buckets: 10);

    state = AsyncData(CalibrationStateLoaded(
      buckets: buckets,
      bets: bets,
      username: username,
    ));
  }
}

sealed class CalibrationState {}

class CalibrationStateEmpty extends CalibrationState {}

class CalibrationStateLoaded extends CalibrationState {
  final List<OutcomeBucket> buckets;
  final List<Bet> bets;
  final String username;

  CalibrationStateLoaded({
    required this.username,
    required this.buckets,
    required this.bets,
  });

  CalibrationStateLoaded copyWith({
    List<OutcomeBucket>? buckets,
    List<Bet>? bets,
    String? username,
  }) {
    return CalibrationStateLoaded(
      buckets: buckets ?? this.buckets,
      bets: bets ?? this.bets,
      username: username ?? this.username,
    );
  }
}

final calibrationControllerProvider =
    AsyncNotifierProvider.autoDispose<CalibrationController, CalibrationState>(
  CalibrationController.new,
);

void generateBetMock(List<Bet> bets) {
  final buffer = StringBuffer();
  buffer.writeln('final bets = [');

  for (final bet in bets) {
    buffer.write('  Bet(');
    buffer.write("id: '${bet.id}', ");

    // Handle BetOutcome
    if (bet.outcome is BinaryYesBetOutcome) {
      buffer.write(
          'outcome: BinaryYesBetOutcome(probAfter: ${(bet.outcome as BinaryYesBetOutcome).probAfter}), ');
    } else if (bet.outcome is BinaryNoBetOutcome) {
      buffer.write(
          'outcome: BinaryNoBetOutcome(probAfter: ${(bet.outcome as BinaryNoBetOutcome).probAfter}), ');
    } else {
      buffer.write('outcome: UnimplementedBetOutcome(), ');
    }

    // Handle DateTime
    buffer.write(
        "updatedTime: DateTime.parse('${bet.updatedTime.toIso8601String()}'), ");

    // Handle Market
    buffer.write('market: Market(');
    buffer.write("id: '${bet.market.id}', ");

    // Handle MarketOutcome
    if (bet.market.outcome == null) {
      buffer.write('outcome: null');
    } else if (bet.market.outcome is BinaryYesMarketOutcome) {
      buffer.write('outcome: BinaryYesMarketOutcome()');
    } else if (bet.market.outcome is BinaryNoMarketOutcome) {
      buffer.write('outcome: BinaryNoMarketOutcome()');
    } else if (bet.market.outcome is BinaryMktMarketOutcome) {
      buffer.write(
          'outcome: BinaryMktMarketOutcome(probability: ${(bet.market.outcome as BinaryMktMarketOutcome).probability})');
    } else {
      buffer.write('outcome: UnimplementedMarketOutcome()');
    }

    buffer.write('),'); // Close Market
    buffer.writeln('),'); // Close Bet
  }

  buffer.writeln('];');
  debugPrint(buffer.toString());
}
