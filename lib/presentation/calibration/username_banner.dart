import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyper_router/srs/base/hyper_build_context.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_controller.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_route_value.dart';

class UsernameBanner extends ConsumerStatefulWidget {
  const UsernameBanner({
    required this.routeValue,
    super.key,
  });

  final CalibrationRouteValue routeValue;

  @override
  ConsumerState<UsernameBanner> createState() => _UsernameBannerState();
}

class _UsernameBannerState extends ConsumerState<UsernameBanner> {
  late final usernameFieldController =
      TextEditingController(text: widget.routeValue.username);

  @override
  void didUpdateWidget(covariant UsernameBanner oldWidget) {
    super.didUpdateWidget(oldWidget);

    usernameFieldController.text = widget.routeValue.username ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        buildInputField(colors),
        const SizedBox(height: 16),
        buildControlls(colors),
      ],
    );
  }

  Widget buildControlls(ColorScheme colors) {
    return SizedBox(
      height: 48,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildGoButton(colors),
          const SizedBox(width: 8),
          buildRefreshButton(colors),
        ],
      ),
    );
  }

  Material buildInputField(ColorScheme colors) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: colors.surface,
      elevation: 8,
      surfaceTintColor: colors.surfaceTint,
      borderRadius: BorderRadius.circular(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: colors.tertiary,
            ),
            child: Text(
              'Username/link to your Manifold profile',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colors.onTertiary,
              ),
              // textAlign: TextAlign.center,
            ),
          ),
          Consumer(builder: (context, ref, chlid) {
            final state = ref.watch(calibrationControllerProvider.select(
              (value) {
                return value.mapOrNull(
                  error: (error) => error,
                );
              },
            ));

            return TextField(
              controller: usernameFieldController,
              onChanged: (value) {
                const prefix = 'https://manifold.markets/';
                if (usernameFieldController.text.startsWith(prefix)) {
                  usernameFieldController.text =
                      usernameFieldController.text.substring(prefix.length);
                }
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                hintText: "https://manifold.markets/jalasama",
                hintStyle: GoogleFonts.poppins(
                  color: colors.onPrimaryContainer.withOpacity(0.5),
                  fontSize: 16,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: colors.secondary,
                    width: 4,
                    strokeAlign: -1,
                  ),
                  borderRadius: BorderRadius.circular(0),
                ),
                enabledBorder: InputBorder.none,
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: colors.error, width: 4),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: colors.error, width: 2),
                ),
                errorStyle: GoogleFonts.poppins(
                  fontSize: 12,
                ),
                errorText: state?.error.toString(),
              ),
              style: GoogleFonts.poppins(
                color: colors.onPrimaryContainer,
                fontSize: 16,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget buildGoButton(ColorScheme colors) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(calibrationControllerProvider);

      final usernameState = switch (state.valueOrNull) {
        AsyncData(value: CalibrationStateData(username: final username)) =>
          username,
        _ => null,
      };

      return ValueListenableBuilder(
        valueListenable: usernameFieldController,
        builder: (context, value, child) {
          final goButtonEnabled = value.text != usernameState &&
              value.text.isNotEmpty &&
              !state.isLoading;

          return Expanded(
            child: ElevatedButton(
              onPressed: switch (goButtonEnabled) {
                true => () {
                    context.hyper.navigate(
                      widget.routeValue.copyWith(
                        username: usernameFieldController.text,
                      ),
                    );
                  },
                false => null,
              },
              child: const Text('Go'),
            ),
          );
        },
      );
    });
  }

  Widget buildRefreshButton(ColorScheme colors) {
    return AspectRatio(
      aspectRatio: 1,
      child: Consumer(builder: (context, ref, child) {
        final state = ref.watch(calibrationControllerProvider);

        return IconButton(
          onPressed: switch (state.valueOrNull) {
            CalibrationStateData _ => () {
                if (widget.routeValue.username case final username?) {
                  ref.read(calibrationControllerProvider.notifier).setParams(
                        username: username,
                        nofBuckets: widget.routeValue.buckets,
                        weighByMana: widget.routeValue.weighByMana,
                        forceRefresh: true,
                      );
                }
                // ref.read(calibrationControllerProvider.notifier).refresh();
              },
            _ => null,
          },
          icon: const Icon(Icons.refresh),
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            side: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return BorderSide.none;
                } else {
                  return BorderSide(
                    color: colors.primary,
                    width: 2,
                  );
                }
              },
            ),
            overlayColor:
                WidgetStatePropertyAll(colors.primary.withOpacity(0.1)),
            foregroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return colors.onSurface.withOpacity(0.5);
                } else {
                  return colors.primary;
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
