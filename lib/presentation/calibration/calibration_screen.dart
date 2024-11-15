import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyper_router/hyper_router.dart';
import 'package:hyper_router/srs/url/url_data.dart';
import 'package:manifold_callibration/entities/exceptions.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_controller.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_page.dart';

class CalibrationRouteValue extends RouteValue {
  final String? username;

  CalibrationRouteValue(this.username);
}

class CalibrationRouteUrlParser extends UrlParser<CalibrationRouteValue> {
  static String emptyValue = 'enter-username';

  @override
  (CalibrationRouteValue, Iterable<String>)? decode(UrlData url) {
    if (url.segments.first == 'user') {
      final second = url.segments.elementAtOrNull(1);
      if (second != null) {
        return (CalibrationRouteValue(second), url.segments.skip(2));
      } else {
        return (CalibrationRouteValue(null), url.segments.skip(1));
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

class CalibrationScreen extends ConsumerStatefulWidget {
  const CalibrationScreen({
    required this.routeValue,
    super.key,
  });

  final CalibrationRouteValue routeValue;

  static const _chartSize = 400.0;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CalibrationScreenState();
  }
}

class _CalibrationScreenState extends ConsumerState<CalibrationScreen> {
  late final usernameFieldController =
      TextEditingController(text: widget.routeValue.username);

  @override
  void didUpdateWidget(covariant CalibrationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.routeValue.username case final username?
        when username != oldWidget.routeValue.username) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          ref
              .read(calibrationControllerProvider.notifier)
              .setUsername(username);
          usernameFieldController.text = username;
        },
      );
    }
  }

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
          buildLinkBanner(colors),
          const SizedBox(height: 16),
          buildControlls(colors),
          const SizedBox(height: 16),
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(calibrationControllerProvider);

              final page = buildPageFromState(state, colors);

              if (page == null) {
                return const SizedBox.shrink();
              }
              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colors.surface,
                  boxShadow: [
                    BoxShadow(
                      color: colors.shadow,
                      offset: const Offset(0, 4),
                      blurRadius: 5,
                    )
                  ],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: page,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget? buildPageFromState(
    AsyncValue<CalibrationState> state,
    ColorScheme colors,
  ) {
    return state.when(
      data: (data) {
        if (data is CalibrationStateLoaded) {
          return CalibrationPage(state: data);
        } else {
          return null;
        }
      },
      error: (error, stackTrace) {
        if (error is UnexpectedResponseException) {
          return Text(
            error.toString(),
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: colors.error,
            ),
          );
        } else if (error is InvalidUsernameException) {
          return null;
        } else {
          // TODO: log this
          return Text(
            'Hmm. Internal error.',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: colors.error,
            ),
          );
        }
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
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

  Widget buildRefreshButton(ColorScheme colors) {
    return AspectRatio(
      aspectRatio: 1,
      child: Consumer(builder: (context, ref, child) {
        final state = ref.watch(calibrationControllerProvider);

        return IconButton(
          onPressed: switch (state) {
            AsyncData(value: final CalibrationStateLoaded _) => () {
                ref.read(calibrationControllerProvider.notifier).refresh();
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
                    color: colors.secondary,
                    width: 2,
                  );
                }
              },
            ),
            overlayColor:
                WidgetStatePropertyAll(colors.secondary.withOpacity(0.1)),
            foregroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return colors.onSurface.withOpacity(0.5);
                } else {
                  return colors.secondary;
                }
              },
            ),
          ),
        );
      }),
    );
  }

  Widget buildGoButton(ColorScheme colors) {
    return ValueListenableBuilder(
      valueListenable: usernameFieldController,
      builder: (context, value, child) {
        final goButtonEnabled =
            value.text != widget.routeValue.username && value.text.isNotEmpty;
        return Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
              boxShadow: [
                if (goButtonEnabled)
                  BoxShadow(
                    color: colors.shadow,
                    offset: const Offset(0, 4),
                    blurRadius: 5,
                  )
              ],
            ),
            child: ElevatedButton(
              onPressed: switch (goButtonEnabled) {
                true => () {
                    context.hyper.navigate(
                      CalibrationRouteValue(
                        usernameFieldController.text,
                      ),
                    );
                  },
                false => null,
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    side: BorderSide(
                      color: colors.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                elevation: const WidgetStatePropertyAll(0),
                backgroundColor: WidgetStateProperty.resolveWith(
                  (states) {
                    {
                      if (states.contains(WidgetState.disabled)) {
                        return colors.surface;
                      } else {
                        return colors.primary;
                      }
                    }
                  },
                ),
                shadowColor: WidgetStateProperty.resolveWith(
                  (states) {
                    if (states.contains(WidgetState.disabled)) {
                      return Colors.transparent;
                    } else {
                      return colors.shadow;
                    }
                  },
                ),
                side: WidgetStateBorderSide.resolveWith(
                  (states) {
                    if (states.contains(WidgetState.disabled)) {
                      return BorderSide(
                        color: colors.onSurface.withOpacity(0.5),
                        width: 2,
                      );
                    } else {
                      return BorderSide(color: colors.primary, width: 2);
                    }
                  },
                ),
                foregroundColor: WidgetStateProperty.resolveWith(
                  (states) {
                    if (states.contains(WidgetState.disabled)) {
                      return colors.onSurface.withOpacity(0.5);
                    } else {
                      return colors.onPrimary;
                    }
                  },
                ),
                textStyle: WidgetStatePropertyAll(
                  GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              child: const Text('Go'),
            ),
          ),
        );
      },
    );
  }

  Container buildLinkBanner(ColorScheme colors) {
    return Container(
      // padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: colors.shadow,
            offset: const Offset(0, 4),
            blurRadius: 5,
          )
        ],
      ),
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
          // const SizedBox(height: 4),
          Consumer(builder: (context, ref, chlid) {
            final state = ref.watch(calibrationControllerProvider);

            return TextField(
              controller: usernameFieldController,
              onChanged: (value) {
                const prefix = 'https://manifold.markets/';
                if (usernameFieldController.text.startsWith(prefix)) {
                  usernameFieldController.text =
                      usernameFieldController.text.substring(prefix.length);
                }

                // usernameFieldController.text =
                //     value.replaceFirst(RegExp('https://manifold.markets/'), '');
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
                errorText: state.whenOrNull(
                  error: (error, stackTrace) {
                    if (error is InvalidUsernameException) {
                      return error.toString();
                    } else {
                      return null;
                    }
                  },
                ),
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
}
