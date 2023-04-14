import 'package:flutter/material.dart';
import 'package:my_app/pie_chart.dart';
import 'package:my_app/budget.dart';

class SpendingSummary extends StatefulWidget {
  const SpendingSummary({super.key});

  @override
  State<SpendingSummary> createState() => _SpendingSummaryState();
}

class _SpendingSummaryState extends State<SpendingSummary> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            '\$200',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Text(
            'Spent this week',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(),
                BudgetButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
