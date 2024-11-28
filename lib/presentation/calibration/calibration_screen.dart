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
                weighByMana: widget.routeValue.weighByMana,
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
                weighByMana: widget.routeValue.weighByMana,
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
          Text(
            'Updates:',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: colors.onSurface.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '- Fixed sharing links',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: colors.onSurface.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOutputBanner(ColorScheme colors) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(calibrationControllerProvider);

        return switch (state) {
          AsyncData(value: CalibrationStateData _) => OutputBanner(
              routeValue: widget.routeValue,
            ),
          AsyncData(value: _) => SizedBox.shrink(),
          AsyncError(error: final UnexpectedResponseException e) => Text(
              e.toString(),
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colors.error,
              ),
            ),
          AsyncError(error: final InvalidUsernameException _) =>
            const SizedBox.shrink(),
          AsyncError(error: final e) => Text(
              e.toString(),
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colors.error,
              ),
            ),
          AsyncLoading _ => const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            ),
          _ => SizedBox.shrink(),
        };
      },
    );
  }
}
