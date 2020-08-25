import 'package:flutter/material.dart';
import './sections/intro/intro.dart';
//import 'package:flutter_webpage/sections/navbar/Navbar.dart';
import './widgets/navbar/navigation_bar.dart';
import 'package:flutter_webpage/sections/portfolio/portfolio_section.dart';
import 'package:flutter_webpage/sections/team/team_section.dart';
import './sections/services/services_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(195, 20, 50, 1.0),
                Color.fromRGBO(36, 11, 54, 1.0)
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //Navbar(),
              NavigationBar(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: IntroSection(),
              ),
              ServiceSection(),
              PortfolioSection(),
              TeamSection(),
            ],
          ),
        ),
      ),
    );
  }
}
