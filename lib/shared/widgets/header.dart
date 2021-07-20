import 'package:flutter/material.dart';
import "package:cc_site_flutter/controllers/menu_controller.dart";
import 'package:get/get.dart';
import 'package:cc_site_flutter/constants/app_colors.dart';
import 'package:cc_site_flutter/shared/responsive.dart';
import 'package:cc_site_flutter/shared/widgets/navbar.dart';

class Header extends StatelessWidget {
  // const navBar({Key key}) : super(key: key);
  final MenuController _controller = Get.put(MenuController());

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
                        if (Responsive.isDesktop(context)) NavBar(),
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
