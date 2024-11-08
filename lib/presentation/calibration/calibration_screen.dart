import 'package:flutter/material.dart';
import 'package:hyper_router/hyper_router.dart';
import 'package:hyper_router/srs/url/url_data.dart';

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
        return (CalibrationRouteValue('test-value'), url.segments.skip(1));
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    const minWidth = 400.0;

    return Scaffold(
      body: switch (size) {
        final s when s.width > s.height && s.width > minWidth => Center(
            child: SizedBox(
              width: minWidth,
              child: ListView(
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
                        onPressed: switch (value.text != routeValue.username) {
                          true => () {
                              context.hyper.navigate(
                                CalibrationRouteValue(
                                    usernameFieldController.text),
                              );
                            },
                          false => null,
                        },
                        child: const Text('Go'),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        _ => const Center(),
      },
    );
  }
}
