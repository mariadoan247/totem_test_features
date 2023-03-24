import 'package:flutter/material.dart';
import 'package:totem_test_app/learn_earn.dart';
import 'package:totem_test_app/search.dart';
import 'package:totem_test_app/deals_box1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Totem Deals"),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.discount),
            label: "Deals",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SearchBox(),
              const SizedBox(height: 32),
              const LearnEarn(),
              const SizedBox(height: 32),
              const Text(
                "DEALS & OFFERS",
                style: TextStyle(
                  color: Color(0xff4f4d4d),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Expanded(
                    child: DealsBox1(
                      companyName: "She Native",
                      percentBack: 5,
                      logo:
                          "https://cdn.shopify.com/s/files/1/0420/8613/articles/Untitled_design_1.png?v=1456278404",
                    ),
                  ),
                  Expanded(
                    child: DealsBox1(
                      companyName: "Target",
                      percentBack: 3,
                      logo:
                          "https://corporate.target.com/_media/TargetCorp/Press/B-roll%20and%20Press%20Materials/Logos/Target_Bullseye-Logo_Red.jpg?preset=640w",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
