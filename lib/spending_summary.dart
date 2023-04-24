import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/pie_chart.dart';
import 'package:my_app/budget.dart';
import 'package:my_app/pie_section.dart';


class SpendingSummary extends StatefulWidget {
  const SpendingSummary({super.key});
  @override
  State<SpendingSummary> createState() => _SpendingSummaryState();
}

class _SpendingSummaryState extends State<SpendingSummary> {
  bool _showFirstWidget = true;
  int _intCode = 0;

  var points = [0.0, pi * 0.6, pi * 1.1, pi * 1.5, pi * 1.8, pi * 2.0];
  List<Category> _categories = [
    Category(
      name: 'Entertainment',
      color: Color(0xFF922929),
      total: 20000,
    ),
    Category(
      name: 'Food',
      color: Color(0xFF250749),
      total: 17000,
    ),
    Category(
      name: 'Travel',
      color: Color(0xFFA78A2A),
      total: 14000,
    ),
    Category(
      name: 'Uncategorized',
      color: Color(0xFF1A7252),
      total: 11000,
    ),
    Category(
      name: 'Shopping',
      color: Color(0xFFC2B6C5),
      total: 80000,
    ),
  ];

  String centsToString(int cents) {
    return "\$" + (cents / 100).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: _showFirstWidget
          ? Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff571c73),
                    Color(0xff232d61),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 360,
              height: 480,
              child: Column(
                children: [
                  Text(
                    '\$850',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    'Spent this month',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        for (int i = _categories.length - 1; i >= 0; --i) ...[
                          PieSection(
                            startAngle: points[i] - pi / 2,
                            sweepAngle: points[i + 1] - points[i],
                            color: _categories[i].color,
                            index: i,
                            onPressed: (int value) {
                              setState(() {
                                _showFirstWidget = false;
                                _intCode = value;
                              });
                            },
                          )
                        ],
                        BudgetButton(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 280,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0;
                                i < (_categories.length / 2).ceil();
                                ++i) ...[
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: _categories[i].color,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    height: 10,
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    _categories[i].name,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = (_categories.length / 2).ceil();
                                i < _categories.length;
                                ++i) ...[
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: _categories[i].color,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    height: 10,
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    _categories[i].name,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : GestureDetector(
              onTap: () {
                setState(() {
                  _showFirstWidget = true;
                });
              },
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: _categories[_intCode].color,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 360,
                height: 480,
                child: Column(
                  children: [
                    Text(
                      centsToString(_categories[_intCode].total),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      _categories[_intCode].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 64,
                    ),
                    Expanded(
                      child: Text(
                        'Transactions',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class Category {
  String name;
  Color color;
  int total;

  Category({required this.name, required this.color, required this.total});
}
