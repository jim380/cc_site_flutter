import 'package:flutter/material.dart';
import '../../shared/section_title.dart';
import '../../constants.dart';
import '../../models/team.dart';

import './team_card.dart';

class TeamSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 2.5),
      constraints: BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            title: "Our Team",
            subTitle: "A collective of blockchain enthusiasts",
            color: Color(0xFF00B1FF),
          ),
          SizedBox(height: kDefaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              members.length,
              (index) => TeamCard(index: index),
            ),
          ),
        ],
      ),
    );
  }
}
