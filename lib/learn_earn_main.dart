import 'package:flutter/material.dart';
import 'package:totem_test_app/learn_box.dart';
import 'package:totem_test_app/quiz_of_the_day.dart';

class LearnEarnMain extends StatefulWidget {
  const LearnEarnMain({
    super.key,
  });

  @override
  State<LearnEarnMain> createState() => _LearnEarnMainState();
}

class _LearnEarnMainState extends State<LearnEarnMain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Read through each mini presentation and take a quiz to earn money. Happy learning!",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        SizedBox(height: 40),
        Text(
          "QUIZ OF THE DAY!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: 'Gothic A1',
          ),
        ),
        SizedBox(height: 16),
        QuizOfTheDay(
          dollarAmount: 1.00,
          time: 5,
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          'TRIBES',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: 'Gothic A1',
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            LearnBox(
              title: 'Origins of Choctaw Nation',
              earnAmount: 400,
              estTime: 3,
              displayImage: Image.asset('assets/images/Choctaw_seal.png'),
            ),
          ],
        ),
      ],
    );
  }
}
