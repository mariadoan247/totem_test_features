import 'package:flutter/material.dart';

class LearnEarn extends StatelessWidget {
  const LearnEarn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 22,
        right: 22,
        top: 14,
        bottom: 11,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff793697),
            Color(0xff792669),
            Color(0xff7A1336),
          ],
        ),
        border: Border.all(
          width: 3,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Learn & Earn",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Learn about finance and earn rewards in under 5 minutes.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 23,
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.5)),
                textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                backgroundColor: Color(0x991e1e1e),
                foregroundColor: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: Text(
                  "See more",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
