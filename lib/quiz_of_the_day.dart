import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class QuizOfTheDay extends StatelessWidget {
  const QuizOfTheDay({super.key});

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
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbzjg8rL3sIpsKOxOEK5LbrJgKHBljTpb01Q&usqp=CAU")),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 130,
            ),
            Center(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
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
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Text("Reward:"),
                                Text("1.00\$"),
                              ],
                            ),
                            Column(
                              children: const [
                                Text("Estimated time"),
                                Text("5 min"),
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
                              backgroundColor: const Color(0x991e1e1e),
                              foregroundColor: Colors.white,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 28.0),
                              child: Text(
                                "START QUIZ",
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
