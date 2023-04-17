import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.numSlides});

  final int numSlides;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(children: [
        for (var i = 0; i < numSlides; i++)
          _singleProgress(
            constraints.maxWidth / numSlides,
            i == 0 ? true : false,
          ),
      ]);
    });
  }

  Widget _singleProgress(double length, bool isColored) {
    return Container(
      color: isColored == true ? const Color(0xff7B84EB) : Colors.white,
      height: 4,
      width: length,
    );
  }
}
