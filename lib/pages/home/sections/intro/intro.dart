import 'package:flutter/material.dart';
import 'package:cc_site_flutter/extensions/hover_extension.dart';

class IntroSection extends StatelessWidget {
  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "The Most Trusted\nIndie Staking Service",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "We are devoted to bring financial freedom to everyone",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () =>
                  //Navigator.of(context).pushNamed(RouteGenerator.LandingRoute),
                  Navigator.pushNamed(context, '/'),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: Text(
                  "Done knowing yall",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ).moveUpOnHover
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Image.asset(
          "assets/images/cc.png",
          width: 300,
          height: 300,
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 2, context),
          );
        } else {
          return Column(
            children: pageChildren(constraints.biggest.width, context),
          );
        }
      },
    );
  }
}
