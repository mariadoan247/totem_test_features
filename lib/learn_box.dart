import 'package:flutter/material.dart';

class LearnBox extends StatelessWidget {
  const LearnBox({
    super.key,
    required this.title,
    required this.earnAmount,
    required this.estTime,
    required this.displayImage,
  });

  final String title;
  final int earnAmount;
  final int estTime;
  final Image displayImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff354fbe),
            Color(0xff1e698e),
            Color(0xff0d9bb9),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      height: 200,
      width: 200,
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: displayImage,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 20.0, top: 12.0, right: 20.0, bottom: 8.0),
            decoration: const BoxDecoration(
              color: Color(0x40000000),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Gothic A1',
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      '$earnAmount points',
                      style: const TextStyle(
                        color: Color(0xff60c060),
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Gothic A1',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '$estTime min',
                      style: const TextStyle(
                        color: Color(0xffe04040),
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Gothic A1',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
