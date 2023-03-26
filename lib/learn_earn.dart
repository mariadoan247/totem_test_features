import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LearnEarn extends StatelessWidget {
  const LearnEarn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 22,
        right: 22,
        top: 16,
        bottom: 16,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff793697),
            Color(0xff792669),
            Color(0xff7A1336),
          ],
        ),
        borderRadius: BorderRadius.all(
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
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Learn about finance and earn rewards in under 5 minutes.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 23,
          ),
          Center(
            child: TextButton(
              onPressed: () => context.go('/learn_earn'),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.5)),
                textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                backgroundColor: const Color(0x991e1e1e),
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
