import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_chart_widget.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_controller.dart';

class CalibrationPage extends StatelessWidget {
  const CalibrationPage({
    required this.state,
    super.key,
  });

  final CalibrationStateLoaded state;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: CalibrationChartWidget(buckets: state.buckets),
        ),
        const SizedBox(height: 16),
        buildBucketButtons(colors),
        const SizedBox(height: 16),
        buildBrierScore(context),
      ],
    );
  }

  Widget buildBrierScore(BuildContext context) {
    return Text(
      'Brier score: ${state.brierScore}',
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget buildBucketButtons(ColorScheme colors) {
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
              emptySelectionAllowed: false,
              multiSelectionEnabled: false,
              onSelectionChanged: (value) {
                ref
                    .read(calibrationControllerProvider.notifier)
                    .changeBuckets(value.first);
              },
              style: ButtonStyle(
                side: WidgetStatePropertyAll(
                  BorderSide(color: colors.secondary, width: 2),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                foregroundColor: WidgetStateProperty.resolveWith(
                  (states) {
                    if (states.contains(WidgetState.selected)) {
                      return colors.onSecondary;
                    } else {
                      return colors.onSurface;
                    }
                  },
                ),
                backgroundColor: WidgetStateProperty.resolveWith(
                  (states) {
                    if (states.contains(WidgetState.selected)) {
                      return colors.secondary;
                    } else {
                      return colors.surface;
                    }
                  },
                ),
                textStyle: WidgetStateTextStyle.resolveWith(
                  (states) {
                    if (states.contains(WidgetState.pressed)) {
                      return GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      );
                    } else {
                      return GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      );
                    }
                  },
                ),
              ),
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
              selected: {state.buckets.length},
            );
          }),
        ),
      ],
    );
  }
}
