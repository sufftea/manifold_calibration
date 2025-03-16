import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manifold_callibration/entities/exceptions.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_controller.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_route_value.dart';
import 'package:manifold_callibration/presentation/calibration/output_banner.dart';
import 'package:manifold_callibration/presentation/calibration/username_banner.dart';
import 'package:logger/logger.dart'; // Import the logger package

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
  static const _mainContentWidth = 400.0;
  static const _sidebarWidth = 300.0;

  //final Logger _logger = Logger(); // Initialize the logger
  final _logger = Logger(
    level: Level.info,
  );

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
                excludeMultipleChoice: widget.routeValue.excludeMultipleChoice,
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
                excludeMultipleChoice: widget.routeValue.excludeMultipleChoice,
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
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: buildContent(colors),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContent(ColorScheme colors) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(calibrationControllerProvider);

      final hasData = state.maybeWhen(
        data: (data) => switch (data) {
          CalibrationStateData _ => true,
          _ => false,
        },
        loading: () => true,
        orElse: () => false,
      );

      _logger.i('buildContent called, hasData: $hasData'); // Use logger

      return LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > _mainContentWidth + 2 * _sidebarWidth) {
          _logger.i('constraints.maxWidth > _mainContentWidth + 2 * _sidebarWidth'); // Use lo
          return Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.top,
            columnWidths: {
              0: FixedColumnWidth(_sidebarWidth),
              1: FixedColumnWidth(_mainContentWidth),
              2: FixedColumnWidth(_sidebarWidth),
            },
            children: [
              TableRow(
                children: [
                  SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: UsernameBanner(routeValue: widget.routeValue),
                  ),
                  SizedBox.shrink(),
                  SizedBox.shrink(),
                ],
              ),
              if (hasData)
                TableRow(children: [
                  SizedBox.shrink(),
                  buildOutputBannerState(colors, state),
                  buildMarketBaselineState(colors, state), // Add Market Baseline State
                  buildHintState(colors, state)
                ]),
            ],
          );
        } else if (constraints.maxWidth > _mainContentWidth + _sidebarWidth) {
          _logger.i('constraints.maxWidth > _mainContentWidth + _sidebarWidth'); // Use logger
          return Table(
            columnWidths: {
              0: FixedColumnWidth(_mainContentWidth),
              1: FixedColumnWidth(_sidebarWidth),
            },
            children: [
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: UsernameBanner(routeValue: widget.routeValue),
                  ),
                  SizedBox.shrink(),
                ],
              ),
              if (hasData)
                TableRow(children: [
                  buildOutputBannerState(colors, state),
                  buildMarketBaselineState(colors, state), // Add Market Baseline State
                  buildHintState(colors, state)
                ]),
            ],
          );
        } else {
          _logger.i('Sized box'); // Use logger
          return SizedBox(
            width: _mainContentWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                UsernameBanner(routeValue: widget.routeValue),
                if (hasData) ...[
                  buildOutputBannerState(colors, state),
                  buildMarketBaselineState(colors, state), // Add Market Baseline State
                  buildHintState(colors, state),
                ],
              ],
            ),
          );
        }
      });
    });
  }

  Widget buildOutputBannerState(
    ColorScheme colors,
    AsyncValue<CalibrationState> state,
  ) {
    _logger.i('buildOutputBannerState called'); // Use logger
    return state.when(
      data: (data) {
        if (data is CalibrationStateData) {
          _logger.i('CalibrationStateData condition met'); // Use logger
          return OutputBanner(
            routeValue: widget.routeValue,
          );
        }
        return SizedBox.shrink();
      },
      error: (error, _) => switch (error) {
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
      loading: () => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget buildMarketBaselineState(
    ColorScheme colors,
    AsyncValue<CalibrationState> state,
  ) {
    _logger.i('buildMarketBaselineState called'); // Use logger
    return state.when(
      data: (data) {
        if (data is CalibrationStateData) {
          _logger.i('CalibrationStateData condition met'); // Use logger
          //print("data: $data a  ${data.stats.marketBaseline}");
          final marketBaselineText = 'Market Baseline: ${data.stats.marketBaseline.toStringAsFixed(8)}';
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SelectableText(
              marketBaselineText, // Display Market Baseline
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colors.onSurface,
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
      error: (error, _) => switch (error) {
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
      loading: () => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget buildHintState(
    ColorScheme colors,
    AsyncValue<CalibrationState> state,
  ) {
    return state.maybeWhen(
      data: (data) => switch (data) {
        CalibrationStateData _ => buildHint(colors),
        _ => SizedBox.shrink(),
      },
      orElse: () => SizedBox.shrink(),
    );
  }

  Padding buildHint(ColorScheme colors) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explanation:',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: colors.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Green arrows show the YES bets,',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: colors.onSecondaryContainer,
            ),
          ),
          Text(
            'Red arrows show the NO bets.',
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: colors.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}