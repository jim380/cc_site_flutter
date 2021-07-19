import 'package:flutter/material.dart';
import 'package:cc_site_flutter/pages/home/intro/intro.dart';
import './widgets/navbar/navigation_bar.dart';
import 'package:cc_site_flutter/pages/home/portfolio/portfolio_section.dart';
import 'package:cc_site_flutter/pages/home/team/team_section.dart';
import 'package:cc_site_flutter/pages/home/services/services_section.dart';

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
