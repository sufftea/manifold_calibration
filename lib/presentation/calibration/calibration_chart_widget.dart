import 'dart:math';
import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:manifold_callibration/entities/outcome_bucket.dart';

class CalibrationChartWidget extends StatelessWidget {
  const CalibrationChartWidget({
    required this.buckets,
    super.key,
  });

  final List<OutcomeBucket> buckets;

  @override
  Widget build(BuildContext context) {
    return ScatterChart(
      ScatterChartData(
        minX: 0,
        maxX: 100,
        minY: 0,
        maxY: 100,
        gridData: const FlGridData(
          horizontalInterval: 10,
          verticalInterval: 10,
        ),
        scatterSpots: [
          for (int i = 0; i < buckets.length; i++)
            if (buckets[i].yesRatio != -1)
              () {
                return ScatterSpot(
                  100 * i / buckets.length + 50 / buckets.length,
                  buckets[i].yesRatio * 100,
                  dotPainter: const _CalibrationDotPainter(
                    mainColor: Colors.green,
                    rotate: 0,
                  ),
                );
              }(),
          for (int i = 0; i < buckets.length; i++)
            if (buckets[i].noRatio != -1)
              ScatterSpot(
                100 * i / buckets.length + 50 / buckets.length,
                buckets[i].noRatio * 100,
                dotPainter: const _CalibrationDotPainter(
                  mainColor: Colors.red,
                  rotate: 1,
                ),
              )
        ],
        titlesData: const FlTitlesData(
          show: true,
        ),
      ),
      swapAnimationCurve: Curves.easeOutQuad,
      swapAnimationDuration: const Duration(milliseconds: 200),
    );
  }
}

class _CalibrationDotPainter extends FlDotPainter {
  const _CalibrationDotPainter({
    required this.mainColor,
    required this.rotate,
  });

  final double rotate;
  static const size = Size(12, 12);

  @override
  final Color mainColor;

  @override
  void draw(Canvas canvas, FlSpot spot, Offset offsetInCanvas) {
    var path = Path();
    path.moveTo(0, -size.height);
    path.relativeLineTo(size.width / 2, size.height);
    path.relativeLineTo(-size.width, 0);
    path.close();

    path = path.transform(Matrix4.rotationZ(rotate * pi).storage);

    path = path.shift(offsetInCanvas);

    canvas.drawPath(
      path,
      Paint()..color = mainColor,
    );
  }

  @override
  Size getSize(FlSpot spot) {
    return size;
  }

  @override
  FlDotPainter lerp(FlDotPainter a, FlDotPainter b, double t) {
    if (a is _CalibrationDotPainter && b is _CalibrationDotPainter) {
      return _CalibrationDotPainter(
        mainColor: Color.lerp(a.mainColor, b.mainColor, t)!,
        rotate: lerpDouble(a.rotate, b.rotate, t)!,
      );
    } else {
      return b;
    }
  }

  @override
  List<Object?> get props => [
        mainColor,
        rotate,
      ];
}
