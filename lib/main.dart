import 'package:flutter/material.dart';
import 'pages/home/home.dart';
import 'package:cc_site_flutter/routes/routes.dart';
import 'package:cc_site_flutter/routes/router/router_delegate.dart';
import 'package:cc_site_flutter/routes/router/route_info_parser.dart';
import 'package:cc_site_flutter/models/menu_items.dart';
import 'package:cc_site_flutter/shared/config_nonweb.dart'
    if (dart.library.html) 'package:cc_site_flutter/shared/config_web.dart';

void main() {
  // configureApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SinglePageAppRouterDelegate delegate;
  late SinglePageAppRouteInformationParser parser;
  // final _colors = Colors.primaries.reversed.toList();
  final _menuItems = menu;

  @override
  void initState() {
    super.initState();
    delegate = SinglePageAppRouterDelegate(
      menuItems: _menuItems,
    );
    parser = SinglePageAppRouteInformationParser(_menuItems);
  }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Cypher Core',
    //   theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Montserrat"),
    //   home: HomeView(), //HomePage(),
    //   initialRoute: RouteGenerator.HomeRoute,
    //   // onGenerateInitialRoutes: RouteGenerator.generateInitialRoutes,
    //   onGenerateRoute: RouteGenerator.generateRoute,
    // );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: delegate,
      routeInformationParser: parser,
    );
  }
}
