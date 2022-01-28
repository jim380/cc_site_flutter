import 'package:flutter/material.dart';
import 'package:cc_site_flutter/models/team.dart';
import 'package:cc_site_flutter/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeamCard2 extends StatefulWidget {
  const TeamCard2({
    Key? key,
    this.index,
  }) : super(key: key);

  final int? index;

  @override
  _TeamCard2State createState() => _TeamCard2State();
}

class _TeamCard2State extends State<TeamCard2> {
  double height = 140;
  double bottomHeight = 130;
  double width = 410;
  double turns = 1;

  Duration duration = Duration(milliseconds: 300);
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: duration,
        // margin: EdgeInsets.only(top: kDefaultPadding * 3),
        // padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Color(0xffD9CAB),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: bottomHeight,
              width: 400,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(children: [
                  SizedBox(
                    height: 130,
                  ),
                  HoverText(text: "Linkedin"),
                  HoverText(text: "Twitter"),
                  HoverText(text: "Email"),
                ]),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 130,
              width: 400,
              decoration: BoxDecoration(color: members[widget.index!].color,
                  // borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        blurRadius: 10.0,
                        spreadRadius: 0,
                        offset: const Offset(5, 8)),
                  ]),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          members[widget.index!].userPic!,
                        ),
                        radius: 40.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              members[widget.index!].name!,
                              style: TextStyle(
                                color: Colors.black, //kTextColor,
                                fontSize: 21,
                                fontWeight: FontWeight.w300,
                                // fontStyle: FontStyle.italic,
                                // height: 1.5,
                              ),
                            ),
                            Text(
                              members[widget.index!].name!,
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                borderRadius: BorderRadius.circular(25.0),
                onTap: () {
                  setState(() {
                    height = height == 140 ? 280 : 140;
                    turns = turns == 0.5 ? 1 : 0.5;
                    bottomHeight = bottomHeight == 130 ? 280 : 130;
                  });
                },
                child: AnimatedRotation(
                  turns: turns,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    height: 35.0,
                    width: 35.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color(0xff212121),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: const Icon(
                      FontAwesomeIcons.arrowDown,
                      size: 17.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HoverText extends StatefulWidget {
  final String? text;

  const HoverText({Key? key, required this.text}) : super(key: key);

  @override
  _HoverTextState createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  Color hoverColor = Colors.white;
  Color hoverTextColor = Colors.black87;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (a) {
        setState(() {
          hoverColor = Color(0xff6D9886);
          hoverTextColor = Colors.white;
        });
      },
      onExit: (a) {
        setState(() {
          hoverColor = Colors.white;
          hoverTextColor = Colors.black87;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
        color: hoverColor,
        child: Text(
          widget.text!,
          style: TextStyle(
            color: Colors.black, //kTextColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            // fontStyle: FontStyle.italic,
            // height: 1.5,
          ),
        ),
      ),
    );
  }
}
