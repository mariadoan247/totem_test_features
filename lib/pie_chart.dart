import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PieChart extends StatefulWidget {
  const PieChart({super.key});

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      height: 256,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CustomPaint(
        painter: PiePainter(),
      ),
    );
  }
}

class PiePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset(24, 24) & Size.square(size.height - 48);
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()
      ..color = Color(0xFF800000)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 48;

    var colorBrush1 = Paint()
      ..color = Color(0xFF922929)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 48;

    var colorBrush2 = Paint()
      ..color = Color(0xFF250749)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 48;

    var colorBrush3 = Paint()
      ..color = Color(0xFFA78A2A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 48;

    var colorBrush4 = Paint()
      ..color = Color(0xFF1A7252)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 48;

    var colorBrush5 = Paint()
      ..color = Color(0xFFC2B6C5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 48;

    // canvas.drawCircle(center, radius - 24, fillBrush);

    var points = [0.0, pi * 0.6, pi * 1.1, pi * 1.5, pi * 1.8, pi * 2.0];

    canvas.drawArc(
        rect, points[0] - pi / 2, points[1] - points[0], false, colorBrush1);
    canvas.drawArc(
        rect, points[1] - pi / 2, points[2] - points[1], false, colorBrush2);
    canvas.drawArc(
        rect, points[2] - pi / 2, points[3] - points[2], false, colorBrush3);
    canvas.drawArc(
        rect, points[3] - pi / 2, points[4] - points[3], false, colorBrush4);
    canvas.drawArc(
        rect, points[4] - pi / 2, points[5] - points[4], false, colorBrush5);

    const RadialGradient gradient = RadialGradient(
      center: Alignment(0.7, -0.6),
      radius: 0.2,
      colors: <Color>[Color(0xFFFFFF00), Color(0xFF0099FF)],
      stops: <double>[0.4, 1.0],
    );
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) {
      // Annotate a rectangle containing the picture of the sun
      // with the label "Sun". When text to speech feature is enabled on the
      // device, a user will be able to locate the sun on this picture by
      // touch.
      Rect rect = Offset.zero & size;
      final double width = size.shortestSide * 0.4;
      rect = const Alignment(0.8, -0.9).inscribe(Size(width, width), rect);
      return <CustomPainterSemantics>[
        CustomPainterSemantics(
          rect: rect,
          properties: const SemanticsProperties(
            label: 'Sun',
            textDirection: TextDirection.ltr,
          ),
        ),
      ];
    };
  }

  // Since this Sky painter has no fields, it always paints
  // the same thing and semantics information is the same.
  // Therefore we return false here. If we had fields (set
  // from the constructor) then we would return true if any
  // of them differed from the same fields on the oldDelegate.
  @override
  bool shouldRepaint(PiePainter oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(PiePainter oldDelegate) => false;
}
