import 'package:flutter/material.dart';
import 'package:totem_test_app/learn_and_earn/learn_box.dart';
import 'package:totem_test_app/learn_and_earn/quiz_of_the_day.dart';

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
        const Text(
          "Read through each mini presentation and take a quiz to earn money. Happy learning!",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(height: 40),
        const Text(
          "QUIZ OF THE DAY!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: 'Gothic A1',
          ),
        ),
        const SizedBox(height: 16),
        const QuizOfTheDay(
          dollarAmount: 1.00,
          time: 5,
        ),
        const SizedBox(
          height: 24,
        ),
        const Text(
          'TRIBES',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: 'Gothic A1',
          ),
        ),
        const SizedBox(
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
