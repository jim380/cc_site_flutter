import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cc_site_flutter/controllers/menu_controller.dart'
    as Local_MenuController;
import 'package:cc_site_flutter/constants/app_colors.dart';
import 'package:cc_site_flutter/routes/routes.dart';

class NavBar extends StatelessWidget {
  final Local_MenuController.MenuController _controller =
      Get.put(Local_MenuController.MenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: List.generate(
          _controller.menuItems.length,
          (index) => NavBarItem(
            text: _controller.menuItems[index],
            isActive: index == _controller.selectedIndex,
            press: () {
              _controller.setMenuIndex(index);
            },
          ),
        ),
      ),
    );
  }
}

class NavBarItem extends StatefulWidget {
  const NavBarItem({
    Key? key,
    required this.isActive,
    required this.text,
    required this.press,
  }) : super(key: key);

  final bool isActive;
  final String text;
  final VoidCallback press;

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  bool _isHover = false;

  Color _borderColor() {
    if (widget.isActive) {
      return kPrimaryColor;
    } else if (!widget.isActive & _isHover) {
      return kPrimaryColor.withOpacity(0.4);
    }
    return Colors.transparent;
  }

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
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: _borderColor(), width: 3),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
