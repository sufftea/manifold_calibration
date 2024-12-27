import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manifold_callibration/entities/exceptions.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_controller.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_route_value.dart';
import 'package:manifold_callibration/presentation/calibration/output_banner.dart';
import 'package:manifold_callibration/presentation/calibration/username_banner.dart';

class CalibrationScreen extends ConsumerStatefulWidget {
  const CalibrationScreen({
    required this.routeValue,
    super.key,
  });

  final CalibrationRouteValue routeValue;

  @override
  ConsumerState<CalibrationScreen> createState() => _CalibrationScreenState();
}

class _CalibrationScreenState extends ConsumerState<CalibrationScreen> {
  static const _chartSize = 400.0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (widget.routeValue.username case final username?) {
          ref.read(calibrationControllerProvider.notifier).setParams(
                username: username,
                nofBuckets: widget.routeValue.buckets,
                weighByMana: widget.routeValue.weightByMana,
              );
        }
      },
    );
  }

  @override
  void didUpdateWidget(covariant CalibrationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (widget.routeValue.username case final username?) {
          ref.read(calibrationControllerProvider.notifier).setParams(
                username: username,
                nofBuckets: widget.routeValue.buckets,
                weighByMana: widget.routeValue.weightByMana,
              );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: Center(
        child: SizedBox(
          width: _chartSize,
          child: buildContent(context),
        ),
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UsernameBanner(routeValue: widget.routeValue),
          const SizedBox(height: 16),
          buildOutputBanner(colors),
          const SizedBox(height: 32),
          buildUpdates(colors),
        ],
      ),
    );
  }

  Widget buildUpdates(ColorScheme colors) {
    return Column(
      children: [
        Text(
          'Updates (most recent at the top):',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: colors.onSurface.withValues(alpha: 0.5),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '- Sells used to be counted as normal bets.',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: colors.onSurface.withValues(alpha: 0.5),
          ),
        ),
        Text(
          '- Fixed sharing links.',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: colors.onSurface.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }

  Widget buildOutputBanner(ColorScheme colors) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(calibrationControllerProvider);

        return state.map(
          data: (data) => switch (data.valueOrNull) {
            CalibrationStateData _ => OutputBanner(
                routeValue: widget.routeValue,
              ),
            _ => SizedBox.shrink(),
          },
          error: (error) => switch (error.error) {
            UnexpectedResponseException e => Text(
                e.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: colors.error,
                ),
              ),
            InvalidUsernameException _ => const SizedBox.shrink(),
            final e => Text(
                e.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: colors.error,
                ),
              ),
          },
          loading: (_) => const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
