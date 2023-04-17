import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:totem_test_app/learn_and_earn/progress_bar.dart';

class SingleContent extends StatefulWidget {
  const SingleContent({super.key});

  @override
  State<SingleContent> createState() => _SingleContentState();
}

class _SingleContentState extends State<SingleContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Color(0xffd0d0d0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  // Progress bar and exit button
                  const SizedBox(height: 48),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    child: ProgressBar(numSlides: 2),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 9),
                      child: InkWell(
                        child: Image.asset('assets/images/close_content.png'),
                        onTap: () {
                          context.go('/learn_earn');
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  // Content title and text
                  const Center(
                    child: Text(
                      "Stock 1",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff7B84EB)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 82),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        text:
                            'The stock market is a marketplace where stocks or ',
                        children: [
                          TextSpan(
                            text: 'shares',
                            style: TextStyle(color: Color(0xff7B84EB)),
                          ),
                          TextSpan(
                            text: ' of publicly traded companies are ',
                          ),
                          TextSpan(
                            text: 'bought and sold.',
                            style: TextStyle(color: Color(0xff7B84EB)),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Spacer(),
              // The bottom container for the image
              Container(
                padding: const EdgeInsets.all(80),
                color: Colors.white,
                width: double.infinity,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://ca-times.brightspotcdn.com/dims4/default/b6f626c/2147483647/strip/true/crop/5205x3470+0+0/resize/1200x800!/format/webp/quality/80/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F85%2F74%2F56a2f96443aea78c00cadbc5c7b9%2Ffinancial-markets-25408.jpg",
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          width: 100,
          child: GestureDetector(
              // Didn't work until the container has a color
              behavior: HitTestBehavior.opaque,
              onTap: () {
                print("I was clicked");
              },
              child: Container(
                width: 100,
                // color: Colors.transparent,
              )),
        ),
      ]),
    );
  }
}
