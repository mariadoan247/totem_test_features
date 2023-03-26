import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn & Earn"),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Text(
                "Read through each mini presentation and take a quiz to earn money. Happy learning!",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              SizedBox(height: 39),
              Text(
                "QUIZ OF THE DAY!",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              SizedBox(height: 16),
              QuizOfTheDay(
                dollarAmount: 1.00,
                time: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
