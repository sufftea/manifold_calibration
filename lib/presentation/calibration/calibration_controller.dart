import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manifold_callibration/data/bets_repository.dart';
import 'package:manifold_callibration/domain/calibration_service.dart';
import 'package:manifold_callibration/entities/bet.dart';
import 'package:manifold_callibration/entities/bet_outcome.dart';
import 'package:manifold_callibration/entities/market_outcome.dart';
import 'package:manifold_callibration/entities/outcome_bucket.dart';

class CalibrationController extends AutoDisposeNotifier<CalibrationState> {
  @override
  CalibrationState build() {
    return const CalibrationStateEmpty();
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
      value._cancelLoading?.call();
      await _loadState(value.username, value.buckets.length);
    }
  }

  Future<void> _loadState(String username, [int? nofBuckets]) async {
    try {
      final (cancel, ctx) = Context.withCancel();
      state = CalibrationStateLoading(cancelLoading: cancel);

      final betsRepo = ref.watch(betsRepositoryProvider);
      final calibrationService = ref.read(calibrationServiceProvider);

      final batchStream = betsRepo.getUserBets(ctx, username);

      await for (final batch in batchStream) {
        final List<Bet> bets;

        switch (state) {
          case CalibrationStateData value:
            bets = [...value.bets, ...batch.bets];
            nofBuckets = value.buckets.length;
          default:
            bets = batch.bets;
        }

        final buckets = calibrationService.calculateCalibration(
          bets: bets,
          nofBuckets: nofBuckets ?? 10,
        );

        final brierScore = calibrationService.calculateBrierScore(bets);
        final standardError =
            calibrationService.calculateStandardError(bets, brierScore);

        state = CalibrationStateData(
          buckets: buckets,
          bets: bets,
          username: username,
          brierScore: brierScore,
          standardError: standardError,
          nofTotalMarkets: batch.total,
          nofLoadedMarkets: batch.loaded,
        );
      }
    } on Exception catch (e, s) {
      state = CalibrationStateError(e, s);
      return;
    }
  }
}

sealed class CalibrationState {
  final void Function()? _cancelLoading;

  const CalibrationState({
    void Function()? cancelLoading,
  }) : _cancelLoading = cancelLoading;
}

class CalibrationStateEmpty extends CalibrationState {
  const CalibrationStateEmpty({super.cancelLoading});
}

class CalibrationStateLoading extends CalibrationState {
  const CalibrationStateLoading({super.cancelLoading});
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
  final double standardError;
  final int nofLoadedMarkets;
  final int nofTotalMarkets;

  CalibrationStateData({
    required this.brierScore,
    required this.username,
    required this.buckets,
    required this.bets,
    required this.standardError,
    required this.nofTotalMarkets,
    required this.nofLoadedMarkets,
    super.cancelLoading,
  });

  CalibrationStateData copyWith({
    List<OutcomeBucket>? buckets,
    List<Bet>? bets,
    double? brierScore,
    String? username,
    double? standardError,
    int? nofLoadedMarkets,
    int? nofTotalMarkets,
  }) {
    return CalibrationStateData(
      standardError: standardError ?? this.standardError,
      brierScore: brierScore ?? this.brierScore,
      buckets: buckets ?? this.buckets,
      bets: bets ?? this.bets,
      username: username ?? this.username,
      cancelLoading: super._cancelLoading,
      nofLoadedMarkets: nofLoadedMarkets ?? this.nofLoadedMarkets,
      nofTotalMarkets: nofTotalMarkets ?? this.nofTotalMarkets,
    );
  }
}

final calibrationControllerProvider =
    NotifierProvider.autoDispose<CalibrationController, CalibrationState>(
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
