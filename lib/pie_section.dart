import 'dart:math';

import 'package:flutter/material.dart';

class PieSection extends StatelessWidget {
  final double startAngle;
  final double sweepAngle;
  final Color color;
  final int index;
  final ValueSetter<int> onPressed;

  PieSection({
    required this.startAngle,
    required this.sweepAngle,
    required this.color,
    required this.index,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(index);
      },
      child: CustomPaint(
        size: Size(280, 280),
        painter: _SectionPainter(
          startAngle: startAngle,
          sweepAngle: sweepAngle,
          color: color,
        ),
      ),
    );
  }
}

class _SectionPainter extends CustomPainter {
  final double startAngle;
  final double sweepAngle;
  final Color color;

  _SectionPainter({
    required this.startAngle,
    required this.sweepAngle,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    size = Size(280, 280);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    const outerRadius = 140.0;
    const innerRadius = 92.0;

    final path = Path()
      ..moveTo(center.dx, center.dy)
      ..arcTo(
        Rect.fromCircle(center: center, radius: outerRadius),
        startAngle,
        sweepAngle,
        true,
      )
      ..lineTo(
        center.dx + innerRadius * cos(startAngle + sweepAngle),
        center.dy + innerRadius * sin(startAngle + sweepAngle),
      )
      ..arcTo(
        Rect.fromCircle(center: center, radius: innerRadius),
        startAngle + sweepAngle,
        -sweepAngle,
        true,
      )
      ..lineTo(
        center.dx + outerRadius * cos(startAngle),
        center.dy + outerRadius * sin(startAngle),
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
