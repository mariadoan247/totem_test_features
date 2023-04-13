import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BudgetButton extends StatefulWidget {
  const BudgetButton({super.key});

  @override
  State<BudgetButton> createState() => _BudgetButtonState();
}

const double smallLogo = 100;
const double bigLogo = 200;

class _BudgetButtonState extends State<BudgetButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> myAnimation;
  late final Animation<double> animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _controller.forward();
    myAnimation = Tween<double>(
      begin: 1,
      end: 0.5,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 120,
          width: 120,
          child: CustomPaint(
            painter: BudgetPainter(),
          ),
        ),
        RotationTransition(
          turns: myAnimation,
          child: Container(
            alignment: Alignment.topCenter,
            height: 120,
            width: 120,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Container(
          child: TextButton(
            onPressed: () {
              _controller.reset();
              _controller.forward();
            },
            child: Text(
              "Budget\n\$350",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: "Gothic A1",
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(),
      ],
    );
  }
}

class BudgetPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & Size(size.width - 5, size.height - 5);
    var budgetBrush = Paint()
      ..color = Color.fromARGB(255, 100, 253, 77)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawArc(rect, -pi / 2, -pi, false, budgetBrush);
  }

  @override
  bool shouldRepaint(BudgetPainter oldDelegate) => false;
}
