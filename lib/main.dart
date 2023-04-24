import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:totem_test_app/deals_and_offers.dart';
import 'package:totem_test_app/resources/learn_and_earn/content_main.dart';
import 'package:totem_test_app/resources/learn_and_earn/single_content.dart';
import 'package:totem_test_app/resources/learn_and_earn/learn_earn_main.dart';
import 'package:totem_test_app/resources/resources_main.dart';
import 'package:totem_test_app/resources/benefits.dart';
import 'package:totem_test_app/resources/cdib.dart';
import 'package:totem_test_app/resources/donations/explore_tribes.dart';
import 'package:totem_test_app/spending_summary.dart';
import 'resources/donations/donationChahta.dart';
import 'resources/donations/donationChahtaComplete.dart';
import 'resources/donations/donations_main.dart';

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
          title: "Account",
          child: SpendingSummary(),
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
          title: "Donation",
          child: DonationsMain(),
        ),
      ),
      GoRoute(
        path: '/cdib',
        builder: (context, state) => const GenericPage(
          title: "CDIB",
          child: CDIB(),
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
          path: '/content', builder: (context, state) => const ContentMain()),
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
      route: '/resources',
      icon: Icons.bookmark,
      label: 'Resources',
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
