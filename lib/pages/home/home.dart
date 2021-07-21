import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:cc_site_flutter/pages/home/portfolio/portfolio_section.dart';
import 'package:cc_site_flutter/pages/home/team/team_section.dart';
import 'package:cc_site_flutter/pages/home/services/services_section.dart';
import 'package:cc_site_flutter/pages/home/intro/intro.dart';
import 'package:get/get.dart';
import "package:cc_site_flutter/controllers/menu_controller.dart";
import 'package:cc_site_flutter/shared/widgets/header.dart';
import 'package:cc_site_flutter/shared/widgets/side_menu.dart';
import 'package:cc_site_flutter/pages/home/footer/footer.dart';
import 'package:cc_site_flutter/models/menu_items.dart';
import 'package:flutter/foundation.dart';

class HomeView extends StatelessWidget {
  // const HomeView({Key? key}) : super(key: key);
  final MenuController _controller = Get.put(MenuController());
  final List<Menu> menuItems;
  final ValueListenable<Menu>? menuItemNotifier;

  HomeView({
    Key? key,
    required this.menuItems,
    this.menuItemNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        key: _controller.scaffoldkey,
        // drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
        //     ? NavigationDrawer()
        //     : null,
        drawer: SideMenu(),
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(195, 20, 50, 1.0),
                  Color.fromRGBO(36, 11, 54, 1.0)
                ]),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Navbar(),
                // NavigationBar(),
                Header(
                  menuItems: menuItems,
                  menuItemNotifier: menuItemNotifier as ValueNotifier<Menu>,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 40.0),
                  child: IntroSection(),
                ),
                ServiceSection(
                  menuItems: menuItems,
                  menuItemNotifier: menuItemNotifier as ValueNotifier<Menu>,
                ),
                PortfolioSection(),
                TeamSection(),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
