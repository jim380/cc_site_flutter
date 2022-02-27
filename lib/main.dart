import 'package:cc_site_flutter/pages/landing/landing.dart';
import 'package:flutter/material.dart';
import 'package:cc_site_flutter/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Flurorouter.setupRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cypher Core',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Montserrat"),
      home: Landing(), //HomePage(),
      initialRoute: '/',
      // onGenerateInitialRoutes: RouteGenerator.generateInitialRoutes,
      onGenerateRoute: Flurorouter.router.generator,
    );
  }
}
