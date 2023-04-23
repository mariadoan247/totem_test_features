import 'package:flutter/material.dart';
import 'package:totem_test_app/boxes/big_box.dart';

// TODO: get data from elsewhere
const _resources = [
  _ResourceConfiguration(
    title: "Native American Benefits",
    summary: "Search through all the available Native American benefits.",
    route: "/benefits",
    colors: [
      Color(0xff0FBEE0),
      Color(0xff364BA4),
    ],
  ),
  _ResourceConfiguration(
    title: "Donations",
    summary: "Support your favorite Native American charities.",
    route: "/donations",
    colors: [
      Color(0xff364BA4),
      Color(0xff571C73),
    ],
  ),
  _ResourceConfiguration(
    title: "Learn & Earn",
    summary:
        "Learn about finance or Native American topics and earn rewards in less than 5 minutes.",
    route: "/learn_earn",
    colors: [
      Color(0xff571C73),
      Color(0xff7A3595),
    ],
  ),
  _ResourceConfiguration(
    title: "Applying for CDIB",
    summary: "Follow these fast easy steps to get your CDIB card.",
    route: "/cdib",
    colors: [
      Color(0xff793697),
      Color(0xff792669),
      Color(0xff7A1336),
    ],
  ),
];

class Resources extends StatefulWidget {
  const Resources({
    super.key,
  });

  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "RESOURCES",
          style: TextStyle(
            color: Color(0xff4f4d4d),
            fontSize: 12,
          ),
        ),
        for (int i = 0; i < _resources.length; i++) ...[
          const SizedBox(height: 32),
          BigBox(
            title: _resources[i].title,
            summary: _resources[i].summary,
            route: _resources[i].route,
            colors: _resources[i].colors,
          ),
        ],
      ],
    );
  }
}

class _ResourceConfiguration {
  const _ResourceConfiguration({
    required this.title,
    required this.summary,
    required this.route,
    required this.colors,
  });

  final String title;

  final String summary;

  final String route;

  final List<Color> colors;
}
