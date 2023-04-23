import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FinishedDonation extends StatelessWidget {
  const FinishedDonation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.only(top: 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff571C73),
                Color(0xff232D61),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 16),
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                  size: 160,
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Column(
                    children: const [
                      Text(
                        "Your generosity is truly appreciated and will make a meaningful difference!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Gothic A1',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: 200,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(32),
                      onTap: () => context.go('/'),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: const Color(0xff1E1E1E).withOpacity(0.6),
                        ),
                        child: const Center(
                          child: Text(
                            'My Account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Gothic A1',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
