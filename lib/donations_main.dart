import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DonationsMain extends StatelessWidget {
  const DonationsMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
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
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 70.0, bottom: 60),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Image.asset(
                        'assets/images/donations.jpg',
                        height: 160,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 70,
                          right: 70,
                          top: 25,
                          bottom: 100,
                        ),
                        child: Column(
                          children: const [
                            Text(
                              "Support Your Tribe",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Gothic A1',
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Donating to Native American organizations supports education, healthcare, economic development, cultural preservation, and tribal sovereignty.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Gothic A1',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12.5),
                onTap: () => context.push('/explore_tribes'),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      width: 3,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Explore Foundations",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
