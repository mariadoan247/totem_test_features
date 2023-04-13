
import 'dart:ui';
import 'package:flutter/material.dart';

class QuizOfTheDay extends StatelessWidget {
  const QuizOfTheDay({
    super.key,
    required this.dollarAmount,
    required this.time,
  });
  final double dollarAmount;
  final int time;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 230,
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "https://www.financialexpress.com/wp-content/uploads/2023/01/Image-credit-Freepik-31.jpg")),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 130,
            ),
            Center(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.only(
                      left: 22,
                      right: 22,
                    ),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 0.3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.zero,
                          topRight: Radius.zero,
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        )),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Stocks, finances and how to get ahead of the game",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "Reward:",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "$dollarAmount\$",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  "Estimated time",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "$time min",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.5)),
                              textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              backgroundColor:
                                  const Color.fromRGBO(0, 0, 0, 0.3),
                              foregroundColor: Colors.white,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 28.0),
                              child: Text(
                                "Start Quiz",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
