import 'package:flutter/material.dart';
//import 'package:web_app/components/hireme_card.dart';
import '../../models/portfolio.dart';
import '../../shared/section_title.dart';
import '../../constants.dart';
import '../../extensions/hover_extension.dart';
import './portfolio_card.dart';

class PortfolioSection extends StatelessWidget {
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        //margin: EdgeInsets.only(top: kDefaultPadding * 6),
        // just for demo
        // height: 600,
        constraints: BoxConstraints(maxWidth: 1200),
        width: width,
        // decoration: BoxDecoration(
        //   color: Color(0xFFF7E8FF).withOpacity(0.3),
        //   image: DecorationImage(
        //     fit: BoxFit.cover,
        //     image: AssetImage("images/recent_work_bg.png"),
        //   ),
        // ),
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 2.5),
        child: Column(
          children: [
            // Transform.translate(
            //   offset: Offset(0, -80),
            //   child: HireMeCard(),
            // ),
            SectionTitle(
              title: "Our Portfolio",
              subTitle: "Recent Works",
              color: Color(0xFFFFB100),
            ),
            SizedBox(height: kDefaultPadding * 1.5),
            SizedBox(
              // width: width,
              child: Wrap(
                spacing: kDefaultPadding,
                runSpacing: kDefaultPadding * 2,
                children: List.generate(
                  portfolio.length,
                  (index) =>
                      PortfolioCard(index: index, press: () {}).moveUpOnHover,
                ),
              ),
            ),
            //SizedBox(height: kDefaultPadding * 5),
          ],
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width),
          );
        } else if (constraints.maxWidth > 960 && constraints.maxWidth < 1200) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 1.5),
          );
        } else {
          return Column(
            children: pageChildren(constraints.biggest.width),
          );
        }
      },
    );
  }
}
