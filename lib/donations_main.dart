import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DonationsMain extends StatelessWidget {
  const DonationsMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
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
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/donation.jpg',
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 145,
                    right: 130,
                    top: 220,
                    bottom: 16,
                  ),
                  child: const Text(
                    "Support Your Tribe",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 35),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.5),
            color: Colors.transparent,
            border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
          ),
          child: TextButton(
            onPressed: () => context.push('/explore_tribes'),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.5),
              ),
              textStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              "Explore Foundations",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
