import 'package:flutter/material.dart';
import 'package:cc_site_flutter/routes/routes.dart';
import '../navbar/navbar_items/navbar_item.dart';
import './navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(195, 20, 50, 1.0),
              Color.fromRGBO(36, 11, 54, 1.0)
            ]),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: <Widget>[
          NavigationDrawerHeader(),
          NavBarItem(
            'About',
            RouteGenerator.PortfolioRoute,
            icon: Icons.person,
          ),
          NavBarItem(
            'Portfolio',
            RouteGenerator.PortfolioRoute,
            icon: Icons.book,
          ),
          NavBarItem(
            'Publication',
            RouteGenerator.PortfolioRoute,
            icon: Icons.book,
          ),
        ],
      ),
    );
  }
}
