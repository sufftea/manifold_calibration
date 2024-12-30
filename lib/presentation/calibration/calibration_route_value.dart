import 'package:hyper_router/hyper_router.dart';
import 'package:hyper_router/srs/url/url_data.dart';

class CalibrationRouteValue extends RouteValue {
  final String? username;
  final bool weightByMana;
  final int buckets;
  final bool excludeMultipleChoice;

  CalibrationRouteValue({
    this.username,
    this.weightByMana = false,
    this.buckets = 10,
    this.excludeMultipleChoice = false,
  });

  CalibrationRouteValue copyWith({
    String? username,
    bool? weightByMana,
    int? buckets,
    bool? excludeMultipleChoice,
  }) {
    return CalibrationRouteValue(
      username: username ?? this.username,
      weightByMana: weightByMana ?? this.weightByMana,
      buckets: buckets ?? this.buckets,
      excludeMultipleChoice:
          excludeMultipleChoice ?? this.excludeMultipleChoice,
    );
  }
}

class CalibrationRouteUrlParser extends UrlParser<CalibrationRouteValue> {
  static String weightByMana = 'weight-by-mana';
  static String buckets = 'buckets';
  static String excludeMultipleChoice = 'exclude-multiple-choice';

  @override
  (CalibrationRouteValue, Iterable<String>)? decode(UrlData url) {
    if (url.segments.first == 'user') {
      final second = url.segments.elementAtOrNull(1);
      if (second != null) {
        return (
          CalibrationRouteValue(
            username: second,
            weightByMana: url.queryParams[weightByMana]?.isNotEmpty ?? false,
            buckets: switch (url.queryParams[buckets]?.firstOrNull) {
              String buckets => int.tryParse(buckets) ?? 10,
              _ => 10,
            },
            excludeMultipleChoice:
                url.queryParams[excludeMultipleChoice]?.isNotEmpty ?? false,
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
      return UrlData(
        segments: ['user', username],
        queryParams: {
          weightByMana: value.weightByMana ? [''] : [],
          buckets: [value.buckets.toString()],
          excludeMultipleChoice: value.excludeMultipleChoice ? [''] : [],
        },
      );
    } else {
      return UrlData(
        segments: ['user'],
        // queryParams: {
        //   weightByMana: [],
        // },
      );
    }
  }
}
