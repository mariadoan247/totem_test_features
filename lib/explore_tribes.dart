import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExploreTribes extends StatelessWidget {
  const ExploreTribes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffA03C3C),
            Color(0xffC66640),
            Color(0xffBB6E3E),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              width: 0,
              child: Image.asset(
                'assets/images/Chahta.jpeg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                const Expanded(
                  child: Text(
                    "The Chahta Foundation connects life with culture the Chahta Foundation connects life with cultu The Chahta Foundation connects...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20.0, top: 10.0, right: 20.0, bottom: 6.0),
                  decoration: const BoxDecoration(
                    color: Color(0x40000000),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(16)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Chahta Foundation",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Gothic A1',
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
