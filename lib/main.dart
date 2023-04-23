import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:totem_test_app/deals_and_offers.dart';
import 'package:totem_test_app/learn_earn_main.dart';
import 'package:totem_test_app/explore_tribes.dart';

import 'donationChahta.dart';
import 'donationChahtaComplete.dart';
import 'donations_main.dart';

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
        path: '/donations',
        builder: (context, state) => const GenericPage(
          title: "Donation",
          child: DonationsMain(),
        ),
      ),
      GoRoute(
        path: '/explore_tribes',
        builder: (context, state) => const GenericPage(
          title: "Explore Tribes",
          child:
              ExploreTribes(), // add this line to render the ExploreTribes widget
        ),
      ),
      GoRoute(
        path: '/donationChahta',
        builder: (context, state) => const GenericPage(
          title: "Chahta Foundation",
          child:
              DonateChahtaFoundation(), // add this line to render the ExploreTribes widget
        ),
      ),
      GoRoute(
        path: '/donationChahtaComplete',
        builder: (context, state) {
          return const GenericPage(
            title: '',
            child: FinishedDonation(),
          );
        },
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
      route: '/donations',
      icon: Icons.favorite,
      label: 'Donations',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
          //remove
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
