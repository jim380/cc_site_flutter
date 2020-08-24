import 'package:flutter/material.dart';
import '../../shared/section_title.dart';
import '../../constants.dart';
import '../../models/team.dart';

import './team_card.dart';

class TeamSection extends StatelessWidget {
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        //margin: EdgeInsets.only(top: kDefaultPadding * 6),
        constraints: BoxConstraints(maxWidth: 1200),
        width: width,
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 2.5),
        //constraints: BoxConstraints(maxWidth: 1110),
        child: Column(
          children: <Widget>[
            SectionTitle(
              title: "Our Team",
              subTitle: "A collective of blockchain enthusiasts",
              color: Color(0xFF00B1FF),
            ),
            SizedBox(height: kDefaultPadding),
            SizedBox(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: kDefaultPadding,
              runSpacing: kDefaultPadding * 2,
              children: List.generate(
                members.length,
                (index) => TeamCard(index: index),
              ),
            )),
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
