import 'package:flutter/material.dart';
import "package:cc_site_flutter/controllers/menu_controller.dart";
import 'package:get/get.dart';
import 'package:cc_site_flutter/constants/app_colors.dart';
import 'package:cc_site_flutter/shared/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatefulWidget {
  @override
  State<Header> createState() => _HeaderState();
}

List navitems = ["About", "Projects", "Contact"];

class _HeaderState extends State<Header> {
  // const navBar({Key key}) : super(key: key);
  final MenuController _controller = Get.put(MenuController());
  double width = 180;
  double height = 1500;
  int i = 0;
  bool condition = false;

  @override
  void initState() {
    width = 0;
    condition = true;
    super.initState();
    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {
        width = 180;
        height = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        width: double.infinity,
        // color: kDarkBlackColor,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: kMaxWidth),
                padding: EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (!Responsive.isDesktop(context))
                          IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _controller.openOrCloseDrawer();
                            },
                          ),
                        Text(
                          "Cypher Core",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30),
                        ),
                        if (Responsive.isDesktop(context))
                          Row(
                            children: navitems
                                .map((e) => NavButton(
                                      text: e,
                                      function: () {
                                        setState(() {
                                          condition = true;
                                          height = MediaQuery.of(context)
                                              .size
                                              .height;
                                        });
                                        Future.delayed(
                                            Duration(milliseconds: 1000), () {
                                          Navigator.pushNamed(context, '/$e');
                                        });
                                      },
                                    ))
                                .toList(),
                          ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NavButton extends StatefulWidget {
  final String text;
  final Function function;
  final double? height;
  final double? width;
  final Widget? child;
  final double? thickness;
  final Curve? curve;
  final int? milliseconds;

  NavButton(
      {required this.function,
      required this.text,
      this.child,
      this.milliseconds,
      this.height,
      this.curve,
      this.thickness,
      this.width});

  @override
  _NavButtonState createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          widget.function();
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: Text(
            widget.text,
            style: GoogleFonts.poppins(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
