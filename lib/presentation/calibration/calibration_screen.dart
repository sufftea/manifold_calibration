import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyper_router/hyper_router.dart';
import 'package:hyper_router/srs/url/url_data.dart';
import 'package:manifold_callibration/entities/exceptions.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_banner.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_controller.dart';
import 'package:manifold_callibration/presentation/calibration/username_banner.dart';

class CalibrationRouteValue extends RouteValue {
  final String? username;
  final bool weighByMana;

  CalibrationRouteValue({
    this.username,
    this.weighByMana = false,
  });
}

class CalibrationRouteUrlParser extends UrlParser<CalibrationRouteValue> {
  static String emptyValue = 'enter-username';

  @override
  (CalibrationRouteValue, Iterable<String>)? decode(UrlData url) {
    if (url.segments.first == 'user') {
      final second = url.segments.elementAtOrNull(1);
      if (second != null) {
        return (
          CalibrationRouteValue(
            username: second,
            weighByMana: url.queryParams['weigh-by-mana']?.isNotEmpty ?? false,
          ),
          url.segments.skip(2),
        );
      } else {
        return (CalibrationRouteValue(), url.segments.skip(1));
      }
    } else {
      return null;
    }
  }

  @override
  UrlData encode(CalibrationRouteValue value) {
    if (value.username case final username?) {
      return UrlData(segments: ['user', username]);
    } else {
      return UrlData(segments: ['user']);
    }
  }
}

class CalibrationScreen extends StatelessWidget {
  const CalibrationScreen({
    required this.routeValue,
    super.key,
  });

  final CalibrationRouteValue routeValue;

  static const _chartSize = 400.0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      body: Center(
        child: SizedBox(
          width: CalibrationScreen._chartSize,
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
          UsernameBanner(username: routeValue.username),
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
          AsyncData(value: CalibrationStateData _) => CalibrationBanner(),
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
