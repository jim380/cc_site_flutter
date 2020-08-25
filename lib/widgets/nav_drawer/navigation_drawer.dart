import 'package:flutter/material.dart';
import '../../routing/route_names.dart';
import '../navbar/navbar_items/navbar_item.dart';
import './navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

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
          // BONUS: Combine the UI for this widget with the NavBarItem and make it responsive.
          // The UI for the current DrawerItem shows when it's in mobile, else it shows the NavBarItem ui.
          NavBarItem(
            'About',
            PortfolioRoute,
            icon: Icons.person,
          ),
          NavBarItem(
            'Portfolio',
            PortfolioRoute,
            icon: Icons.book,
          ),
          NavBarItem(
            'Publication',
            PortfolioRoute,
            icon: Icons.book,
          ),
        ],
      ),
    );
  }
}
