import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:totem_test_app/deals_and_offers.dart';
import 'package:totem_test_app/learn_earn_main.dart';
import 'package:totem_test_app/resources_main.dart';
import 'package:totem_test_app/benefits.dart';
import 'package:totem_test_app/donations.dart';
import 'package:totem_test_app/cdib.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const GenericPage(
          title: "Main page",
          child: Placeholder(),
        ),
      ),
      GoRoute(
        path: '/deals',
        builder: (context, state) => const GenericPage(
          title: "Totem deals",
          child: DealsAndOffers(),
        ),
      ),
      GoRoute(
        path: '/learn_earn',
        builder: (context, state) => const GenericPage(
          title: "Learn & Earn",
          child: LearnEarnMain(),
        ),
      ),
      GoRoute(
        path: '/resources',
        builder: (context, state) => const GenericPage(
          title: "Resources",
          child: Resources(),
        ),
      ),
      GoRoute(
        path: '/benefits',
        builder: (context, state) => const GenericPage(
          title: "Benefits",
          child: Benefits(),
        ),
      ),
      GoRoute(
        path: '/donations',
        builder: (context, state) => const GenericPage(
          title: "Donations",
          child: Donations(),
        ),
      ),
      GoRoute(
        path: '/cdib',
        builder: (context, state) => const GenericPage(
          title: "CDIB",
          child: CDIB(),
        ),
      ),
    ],
  );
}

class GenericPage extends StatefulWidget {
  const GenericPage({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  State<GenericPage> createState() => _GenericPageState();
}

class _GenericPageState extends State<GenericPage> {
  static int _currentIndex = 0;
  static const _routes = [
    _NavigationItems(
      route: '/',
      icon: Icons.person,
      label: 'Account',
    ),
    _NavigationItems(
      route: '/deals',
      icon: Icons.discount,
      label: 'Deals',
    ),
    _NavigationItems(
      route: '/resources',
      icon: Icons.bookmark,
      label: 'Resources',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Totem Test App"),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: (newIndex) {
          if (_currentIndex == newIndex) return;
          setState(() {
            _currentIndex = newIndex;
            context.go(_routes[newIndex].route);
          });
        },
        items: [
          for (final item in _routes)
            BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: widget.child,
        ),
      ),
    );
  }
}

class _NavigationItems {
  const _NavigationItems({
    required this.route,
    required this.icon,
    required this.label,
  });

  final String route;
  final IconData icon;
  final String label;
}
