import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DealsBox1 extends StatelessWidget {
  const DealsBox1({
    super.key,
    required this.companyName,
    required this.percentBack,
    required this.logo,
  });

  final String companyName;

  final int percentBack;

  final String logo;

  // TODO: Get the URL launcher to work
  Future<void> _launchURL() async {
    final url = Uri.parse(logo);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      print("OPENED!");
    } else {
      throw 'Could not launch $logo';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: InkWell(
          onTap: _launchURL,
          hoverColor: const Color(0x991e1e1e),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.only(
              left: 22,
              right: 22,
              top: 14,
              bottom: 11,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 61,
                  height: 61,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          logo,
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
                Text(
                  companyName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Get $percentBack% cash back from any purchase!",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
