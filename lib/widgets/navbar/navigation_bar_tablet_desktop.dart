import 'package:flutter/material.dart';
import '../../routing/route_names.dart';
import 'navbar_items/navbar_item.dart';
import '../../extensions/hover_extension.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Cypher Core",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            ),
            Row(
              children: <Widget>[
                NavBarItem('Home', HomeRoute).showCursorOnHover.moveUpOnHover,
                SizedBox(
                  width: 30,
                ),
                NavBarItem('About', PortfolioRoute)
                    .showCursorOnHover
                    .moveUpOnHover,
                SizedBox(
                  width: 30,
                ),
                NavBarItem('Portfolio', PortfolioRoute)
                    .showCursorOnHover
                    .moveUpOnHover,
                SizedBox(
                  width: 30,
                ),
                MaterialButton(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {},
                  child: Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white),
                  ),
                ).showCursorOnHover.moveUpOnHover,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
