import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hyper_router/hyper_router.dart';
import 'package:hyper_router/srs/url/url_data.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_chart_widget.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_controller.dart';

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

class CalibrationScreen extends StatelessWidget {
  CalibrationScreen({
    required this.routeValue,
    super.key,
  });

  final CalibrationRouteValue routeValue;

  late final usernameFieldController =
      TextEditingController(text: routeValue.username);

  static const _chartSize = 400.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    const minWidth = _chartSize;

    return Scaffold(
      body: switch (size) {
        final s when s.width > s.height && s.width > minWidth => Center(
            child: SizedBox(
              width: minWidth,
              child: buildContent(),
            ),
          ),
        _ => buildContent(),
      },
    );
  }

  Widget buildContent() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: usernameFieldController,
              decoration: const InputDecoration(
                label: Text('your username'),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: usernameFieldController,
              builder: (context, value, child) {
                return OutlinedButton(
                  onPressed: switch (value.text != routeValue.username &&
                      value.text.isNotEmpty) {
                    true => () {
                        context.hyper.navigate(
                          CalibrationRouteValue(usernameFieldController.text),
                        );
                      },
                    false => null,
                  },
                  child: const Text('Go'),
                );
              },
            ),
            if (routeValue.username case final username?)
              Consumer(
                builder: (context, ref, child) {
                  final state =
                      ref.watch(calibrationControllerProvider(username));
                  return state.when(
                    data: (data) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child:
                                CalibrationChartWidget(buckets: data.buckets),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FilledButton(
                                onPressed: () {
                                  ref
                                      .read(calibrationControllerProvider(
                                              username)
                                          .notifier)
                                      .changeBuckets(4);
                                },
                                child: const Text('4'),
                              ),
                              FilledButton(
                                onPressed: () {
                                  ref
                                      .read(calibrationControllerProvider(
                                              username)
                                          .notifier)
                                      .changeBuckets(10);
                                },
                                child: const Text('10'),
                              ),
                              FilledButton(
                                onPressed: () {
                                  ref
                                      .read(calibrationControllerProvider(
                                              username)
                                          .notifier)
                                      .changeBuckets(30);
                                },
                                child: const Text('30'),
                              )
                            ],
                          )
                        ],
                      );
                    },
                    error: (error, stackTrace) {
                      if (error is DioException) {
                        return Text('Error: ${error.message}');
                      }
                      throw Error.throwWithStackTrace(error, stackTrace);
                    },
                    loading: () {
                      return const CircularProgressIndicator();
                    },
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
