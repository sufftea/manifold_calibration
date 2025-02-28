import 'dart:math';

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
    final colors = ColorScheme.of(context);
    return CustomPaint(
      painter: _CalibrationChartPainter(buckets: buckets, colors: colors),
    );
  }
}

class _CalibrationChartPainter extends CustomPainter {
  _CalibrationChartPainter({
    required this.buckets,
    required this.colors,
  });

  final List<OutcomeBucket> buckets;
  final ColorScheme colors;

  double flipY(Size size, double y) {
    return size.height - y;
  }

  @override
  void paint(Canvas canvas, Size size) {
    const scaleDown = 0.9;
    canvas.translate(
      size.width * (1 - scaleDown) * 0.5,
      size.height * (1 - scaleDown) * 0.5,
    );
    canvas.scale(0.90, 0.90);

    canvas.drawLine(
      Offset(0, flipY(size, 0)),
      Offset(size.width, flipY(size, size.height)),
      Paint()..color = colors.secondary,
    );

    canvas.drawLine(
      Offset(0, flipY(size, 0)),
      Offset(size.width, flipY(size, 0)),
      Paint()..color = colors.secondary,
    );

    canvas.drawLine(
      Offset(0, flipY(size, 0)),
      Offset(0, flipY(size, size.height)),
      Paint()..color = colors.secondary,
    );

    // X-axis marks
    final oneTenthWidth = size.width / 10;
    for (int i = 0; i <= 10; ++i) {
      final o = i * oneTenthWidth;
      canvas.drawLine(
        Offset(o, flipY(size, -4)),
        Offset(o, flipY(size, 4)),
        Paint()
          ..color = colors.secondary
          ..strokeWidth = 1.0,
      );

      canvas.drawLine(
        Offset(o, flipY(size, 0)),
        Offset(o, flipY(size, size.height)),
        Paint()
          ..color = colors.secondary
          ..strokeWidth = 0.5,
      );

      drawLabel(
        canvas,
        (i * 10).toString(),
        Offset(o, flipY(size, -15)),
      );
    }

    final oneTenthHeight = size.height / 10;
    for (int i = 0; i <= 10; ++i) {
      final y = i * oneTenthHeight;
      canvas.drawLine(
        Offset(-4, flipY(size, y)),
        Offset(4, flipY(size, y)),
        Paint()
          ..color = colors.secondary
          ..strokeWidth = 1.0,
      );
      canvas.drawLine(
        Offset(0, flipY(size, y)),
        Offset(size.width, flipY(size, y)),
        Paint()
          ..color = colors.secondary
          ..strokeWidth = 0.5,
      );

      drawLabel(
        canvas,
        (i * 10).toString(),
        Offset(-15, flipY(size, y)),
      );
    }

    for (int i = 0; i < buckets.length; ++i) {
      final bucket = buckets[i];
      final noY = size.height * bucket.noRatio;
      final yesY = size.height * bucket.yesRatio;

      final x = size.width * (i / buckets.length + 0.5 / buckets.length);

      drawMarker(
        canvas: canvas,
        rotation: 0,
        offset: Offset(x, flipY(size, yesY)),
        color: Colors.green,
      );

      drawMarker(
        canvas: canvas,
        rotation: pi,
        offset: Offset(x, flipY(size, noY)),
        color: Colors.red,
      );
    }
  }

  void drawLabel(Canvas canvas, String text, Offset offset) {
    final textStyle = TextStyle(
      color: colors.onPrimaryContainer,
      fontSize: 12,
    );
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: double.infinity,
    );
    // final xCenter = (size.width - textPainter.width) / 2;
    // final yCenter = (size.height - textPainter.height) / 2;
    textPainter.paint(
      canvas,
      offset - Offset(textPainter.width / 2, textPainter.height / 2),
    );
  }

  void drawMarker({
    required Canvas canvas,
    required double rotation,
    required Offset offset,
    required Color color,
  }) {
    const size = Size(12, 12);
    var path = Path();
    path.moveTo(0, -size.height);
    path.relativeLineTo(size.width / 2, size.height);
    path.relativeLineTo(-size.width, 0);
    path.close();

    path = path.transform(Matrix4.rotationZ(rotation).storage);

    path = path.shift(offset);

    canvas.drawPath(
      path,
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(covariant _CalibrationChartPainter oldDelegate) {
    return buckets == oldDelegate.buckets;
  }
}
