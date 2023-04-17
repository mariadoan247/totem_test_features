import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:totem_test_app/learn_and_earn/progress_bar.dart';

class SingleContent extends StatefulWidget {
  const SingleContent({
    super.key,
    required this.title,
    required this.imageLink,
    required this.numPages,
    required this.currentPage,
    this.onTap,
  });

  final String title;
  final String imageLink;
  final int numPages;
  final int currentPage;
  final void Function(int)? onTap;

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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: ProgressBar(
                      numSlides: widget.numPages,
                      currentPage: widget.currentPage,
                    ),
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
                  Center(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.imageLink,
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
          width: 150,
          child: GestureDetector(
              // Didn't work until the container has a color
              behavior: HitTestBehavior.opaque,
              onTap: () {
                widget.onTap?.call(-1);
              },
              child: Container(
                width: 100,
                // color: Colors.transparent,
              )),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          height: 600,
          width: 150,
          child: GestureDetector(
              // Didn't work until the container has a color
              behavior: HitTestBehavior.opaque,
              onTap: () {
                widget.onTap?.call(1);
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
