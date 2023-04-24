import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BudgetButton extends StatefulWidget {
  const BudgetButton({super.key});

  @override
  State<BudgetButton> createState() => _BudgetButtonState();
}

class _BudgetButtonState extends State<BudgetButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> myAnimation;
  late final Animation<double> animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
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
    myAnimation.addListener(() => setState(() {}));
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
            painter: BudgetPainter(angleProps: 1.0 - myAnimation.value),
          ),
        ),
        RotationTransition(
          turns: myAnimation,
          child: Container(
            alignment: Alignment.topCenter,
            height: 130,
            width: 130,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
                border: Border.all(
                  width: 1,
                  color: Colors.white,
                ),
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
            child: Column(
              children: [
                Text(
                  "\$1400",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Gothic A1",
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "budget",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Gothic A1",
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Container(),
      ],
    );
  }
}

class BudgetPainter extends CustomPainter {
  double angleProps;

  BudgetPainter({required this.angleProps});

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & Size(size.width, size.height);
    var budgetBrush = Paint()
      ..color = Color(0xD079B45D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    var budgetBlankBrush = Paint()
      ..color = Color(0xD0D9D9D9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    canvas.drawArc(rect, -pi / 2, -2 * pi * angleProps, false, budgetBrush);

    canvas.drawArc(
        rect, -pi / 2, 2 * pi * (1.0 - angleProps), false, budgetBlankBrush);
  }

  @override
  bool shouldRepaint(BudgetPainter oldDelegate) => false;
}
