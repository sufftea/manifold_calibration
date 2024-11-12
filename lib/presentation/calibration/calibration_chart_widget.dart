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
    debugPrint('buckets: ${buckets.map((e) => e.yesRatio)}');
    return ScatterChart(
      ScatterChartData(
          minX: 0,
          maxX: 100,
          minY: 0,
          maxY: 100,
          scatterSpots: [
            for (int i = 0; i < buckets.length; i++)
              ScatterSpot(
                100 * i / buckets.length,
                buckets[i].yesRatio * 100,
                dotPainter: FlDotCirclePainter(
                  color: Colors.green,
                  radius: 4,
                ),
              ),
            for (int i = 0; i < buckets.length; i++)
              ScatterSpot(
                100 * i / buckets.length,
                buckets[i].noRatio * 100,
                dotPainter: FlDotCirclePainter(
                  color: Colors.red,
                  radius: 4,
                ),
              )
          ],
          titlesData: const FlTitlesData(
            show: true,
          )),
    );
  }
}
