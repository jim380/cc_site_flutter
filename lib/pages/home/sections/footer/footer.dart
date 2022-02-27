import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cc_site_flutter/constants/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      constraints: BoxConstraints(maxWidth: 1200.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                  icon: Icon(FontAwesomeIcons.twitter),
                  tooltip: 'Twitter',
                  color: BrandColors.colorPrimary,
                  onPressed: () {}),
              SizedBox(width: 10.0),
              IconButton(
                  icon: Icon(FontAwesomeIcons.medium),
                  tooltip: 'Medium',
                  color: BrandColors.colorPrimary,
                  onPressed: () {}),
              SizedBox(width: 10.0),
              IconButton(
                  icon: Icon(FontAwesomeIcons.github),
                  tooltip: 'Github',
                  color: BrandColors.colorPrimary,
                  onPressed: () {}),
            ],
          ),
          Image.asset(
            "assets/images/cc.png",
            width: 60,
            height: 60,
          ),
          Text(
            'copyright © 2022 Cypher Core all right reserved',
            style: TextStyle(
              fontSize: 12.0,
              color: BrandColors.colorSecondText,
            ),
          )
        ],
      ),
    );
  }
}
