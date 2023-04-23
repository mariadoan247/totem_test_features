import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DonateChahtaFoundation extends StatefulWidget {
  const DonateChahtaFoundation({
    super.key,
  });

  @override
  _DonateChahtaFoundationState createState() => _DonateChahtaFoundationState();
}

class _DonateChahtaFoundationState extends State<DonateChahtaFoundation> {
  final TextEditingController _controller = TextEditingController();
  bool _showLabel = true;
  bool _isMonthlyDonation = false;
  double donationAmount = 0.0;

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
                    Color(0xff364BA4),
                    Color(0xff1E8FC8),
                    Color(0xff0FBADE),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 40),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Image.asset(
                        'assets/images/Chahta.png',
                        height: 160,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 70,
                          right: 70,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "The Chahta Foundation connects life with culture through positive initiatives that help improve the future for Choctaw people everywhere.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Gothic A1',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 35),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Container(
                                width: 176,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100]?.withOpacity(
                                      0.4), // Make the box more transparent
                                ),
                                child: TextField(
                                  controller: _controller,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText:
                                        _showLabel ? 'Enter amount' : null,
                                    labelStyle: const TextStyle(
                                      color: Color.fromARGB(255, 85, 85, 85),
                                      fontSize: 16,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.attach_money,
                                      color: Color.fromARGB(255, 85, 85, 85),
                                    ),
                                    filled: true,
                                    fillColor: const Color.fromRGBO(
                                        120,
                                        217,
                                        217,
                                        0.1), // Adjust the alpha value to make the box more transparent
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _showLabel = false;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: _isMonthlyDonation,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isMonthlyDonation = value ?? false;
                                    });
                                  },
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Make this a monthly donation',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Gothic A1',
                                  ),
                                ),
                              ],
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
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12.5),
                onTap: () => context
                    .push('/donationChahtaComplete?amount=$donationAmount'),
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
                      "Donate",
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
