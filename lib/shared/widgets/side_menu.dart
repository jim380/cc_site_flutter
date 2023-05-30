import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cc_site_flutter/controllers/menu_controller.dart'
    as Local_MenuController;
import 'package:cc_site_flutter/constants/app_colors.dart';

class SideMenu extends StatelessWidget {
  final Local_MenuController.MenuController _controller =
      Get.put(Local_MenuController.MenuController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kDarkBlackColor,
        child: Obx(
          () => ListView(
            children: [
              DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 3.5),
                  child: SizedBox(
                    height: 80,
                    width: 150,
                    child: Image.asset('assets/images/cc.png'),
                  ),
                ),
              ),
              ...List.generate(
                _controller.menuItems.length,
                (index) => DrawerItem(
                  isActive: index == _controller.selectedIndex,
                  title: _controller.menuItems[index],
                  press: () {
                    _controller.setMenuIndex(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback press;

  const DrawerItem({
    Key? key,
    required this.title,
    required this.isActive,
    required this.press,
  }) : super(key: key);

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  bool _isHover = false;

  // Color _borderColor() {
  //   if (widget.isActive) {
  //     return kPrimaryColor;
  //   } else if (!widget.isActive & _isHover) {
  //     return kPrimaryColor.withOpacity(0.4);
  //   }
  //   return Colors.transparent;
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: kDefaultDuration,
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        // decoration: BoxDecoration(
        //   border: Border(
        //     bottom: BorderSide(color: _borderColor(), width: 3),
        //   ),
        // ),
        child: Text(
          widget.title,
          style: TextStyle(
            color: widget.isActive ? kPrimaryColor : Colors.white,
            fontSize: 18,
            fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
