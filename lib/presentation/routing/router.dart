import 'package:hyper_router/hyper_router.dart';
import 'package:manifold_callibration/presentation/calibration/calibration_screen.dart';

final router = HyperRouter(
  initialRoute: CalibrationRouteValue(null),
  enableUrl: true,
  routes: [
    ValueRoute<CalibrationRouteValue>(
      urlParser: CalibrationRouteUrlParser(),
      screenBuilder: (context, value) => CalibrationScreen(routeValue: value),
    )
  ],
);