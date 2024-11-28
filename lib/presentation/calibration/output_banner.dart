import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyper_router/srs/base/hyper_build_context.dart';
import 'package:manifold_callibration/entities/outcome_bucket.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_chart_widget.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_controller.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_route_value.dart';

class OutputBanner extends StatelessWidget {
  const OutputBanner({
    required this.routeValue,
    super.key,
  });

  final CalibrationRouteValue routeValue;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Material(
      surfaceTintColor: colors.surfaceTint,
      color: colors.surface,
      borderRadius: BorderRadius.circular(4),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildBetsCount(colors),
            buildChart(),
            const SizedBox(height: 16),
            buildBrierScore(context),
            const SizedBox(height: 16),
            buildBucketButtons(context, colors),
            buildWeighByMana(context, colors),
          ],
        ),
      ),
    );
  }

  Widget buildChart() {
    return Consumer(builder: (context, ref, child) {
      final buckets = ref.watch(calibrationControllerProvider.select(
        (value) => value.maybeMap(
          data: (value) {
            return switch (value.value) {
              CalibrationStateData data => data.stats.buckets,
              _ => <OutcomeBucket>[],
            };
          },
          orElse: () => <OutcomeBucket>[],
        ),
      ));

      return AspectRatio(
        aspectRatio: 1,
        child: CalibrationChartWidget(buckets: buckets),
      );
    });
  }

  Widget buildWeighByMana(BuildContext context, ColorScheme colors) {
    return Row(
      children: [
        Checkbox(
          value: routeValue.weighByMana,
          onChanged: (value) {
            if (value == null) {
              return;
            }
            context.hyper.navigate(routeValue.copyWith(
              weighByMana: value,
            ));
          },
        ),
        Text(
          'Weigh by mana',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget buildBetsCount(ColorScheme colors) {
    return Consumer(builder: (context, ref, child) {
      final nofResolvedBets = ref.watch(calibrationControllerProvider.select(
        (value) {
          return value.maybeMap(
            data: (value) => switch (value.value) {
              CalibrationStateData data => data.stats.nofResolvedBets,
              _ => 0,
            },
            orElse: () => 0,
          );
        },
      ));

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '$nofResolvedBets resolved bets',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: colors.onSurface,
          ),
        ),
      );
    });
  }

  Widget buildBrierScore(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final brierScore = ref.watch(calibrationControllerProvider.select(
        (value) {
          return value.maybeMap(
            data: (value) => switch (value.value) {
              CalibrationStateData data => data.stats.brierScore,
              _ => 0,
            },
            orElse: () => 0,
          );
        },
      ));

      return Text(
        'Brier score: $brierScore',
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      );
    });
  }

  Widget buildBucketButtons(BuildContext context, ColorScheme colors) {
    return Row(
      children: [
        Text(
          'Buckets:',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Consumer(builder: (context, ref, child) {
            return SegmentedButton<int>(
              selected: {routeValue.buckets},
              emptySelectionAllowed: false,
              multiSelectionEnabled: false,
              onSelectionChanged: (value) {
                context.hyper.navigate(routeValue.copyWith(
                  buckets: value.first,
                ));
              },
              segments: const [
                ButtonSegment(
                  value: 5,
                  label: Text('5'),
                ),
                ButtonSegment(
                  value: 10,
                  label: Text('10'),
                ),
                ButtonSegment(
                  value: 20,
                  label: Text('20'),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
