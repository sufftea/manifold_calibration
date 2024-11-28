import 'package:hyper_router/hyper_router.dart';
import 'package:hyper_router/srs/url/url_data.dart';

class CalibrationRouteValue extends RouteValue {
  final String? username;
  final bool weighByMana;
  final int buckets;

  CalibrationRouteValue({
    this.username,
    this.weighByMana = false,
    this.buckets = 10,
  });

  CalibrationRouteValue copyWith({
    String? username,
    bool? weighByMana,
    int? buckets,
  }) {
    return CalibrationRouteValue(
      username: username ?? this.username,
      weighByMana: weighByMana ?? this.weighByMana,
      buckets: buckets ?? this.buckets,
    );
  }
}

class CalibrationRouteUrlParser extends UrlParser<CalibrationRouteValue> {
  static String emptyValue = 'enter-username';
  static String weighByMana = 'weigh-by-mana';
  static String buckets = 'buckets';

  @override
  (CalibrationRouteValue, Iterable<String>)? decode(UrlData url) {
    if (url.segments.first == 'user') {
      final second = url.segments.elementAtOrNull(1);
      if (second != null) {
        return (
          CalibrationRouteValue(
              username: second,
              weighByMana: url.queryParams[weighByMana]?.isNotEmpty ?? false,
              buckets: switch (url.queryParams[buckets]?.firstOrNull) {
                String buckets => int.tryParse(buckets) ?? 10,
                _ => 10,
              }),
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
      return UrlData(
        segments: ['user', username],
        queryParams: {
          weighByMana: value.weighByMana ? [''] : [],
          buckets: [value.buckets.toString()],
        },
      );
    } else {
      return UrlData(
        segments: ['user'],
        queryParams: {
          weighByMana: [],
        },
      );
    }
  }
}
