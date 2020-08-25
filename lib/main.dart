import 'package:flutter/material.dart';
import 'home_page.dart';
import 'views/home/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cypher Core',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Montserrat"),
      home: HomeView(), //HomePage(),
    );
  }
}
