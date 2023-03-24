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
            icon: Icon(Icons.tag),
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
            children: const [
              SearchBox(),
              SizedBox(height: 45),
              LearnEarn(),
              SizedBox(height: 45),
              Text(
                "DEALS & OFFERS",
                style: TextStyle(
                  color: Color(0xff4f4d4d),
                  fontSize: 12,
                ),
              ),
              DealsBox1(),
              // SizedBox(
              //   height: 45,
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: const [
              //       DealsBox1(),
              //       DealsBox1(),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
