import 'package:cc_site_flutter/pages/about/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../pages/home/home.dart';

class RouteGenerator {
  static const String HomeRoute = '/';
  static const String PortfolioRoute = '/portfolio';
  static const String AboutRoute = '/about';

  // RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case HomeRoute:
      //   return MaterialPageRoute(
      //     // add CupertinoPageRoute later on
      //     builder: (_) => const HomeView(),
      //   );
      case AboutRoute:
        return MaterialPageRoute(
          // add CupertinoPageRoute later on
          builder: (_) => const AboutPage(),
        );
      default:
        return throw FormatException("Route not found");
    }
  }

  static List<Route> generateInitialRoutes(String name) {
    return <Route>[
      MaterialPageRoute(
        builder: (_) => HomeView(),
      )
    ];
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
