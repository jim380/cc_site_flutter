import 'package:flutter/material.dart';
import 'pages/home/home.dart';
import 'package:cc_site_flutter/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cypher Core',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Montserrat"),
      home: HomeView(), //HomePage(),
      initialRoute: RouteGenerator.HomeRoute,
      // onGenerateInitialRoutes: RouteGenerator.generateInitialRoutes,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
