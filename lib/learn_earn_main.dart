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
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              SizedBox(height: 32),
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
