import 'package:flutter/material.dart';
import 'package:cc_site_flutter/shared/section_title.dart';
import 'package:cc_site_flutter/constants/constants.dart';
import 'package:cc_site_flutter/models/services.dart';

import 'widgets/services_card.dart';

class ServiceSection extends StatelessWidget {
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        // margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
        constraints: BoxConstraints(maxWidth: 1200),
        width: width,
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 2.5),
        child: Column(
          children: [
            SectionTitle(
              color: Color(0xFFFF0000),
              title: "Our Services",
              subTitle: "What we do",
            ),
            SizedBox(height: kDefaultPadding),
            SizedBox(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: kDefaultPadding,
              runSpacing: kDefaultPadding * 2,
              children: List.generate(
                services.length,
                (index) => ServiceCard(index: index),
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
            children: pageChildren(constraints.biggest.width / 2),
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
