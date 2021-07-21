import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cc_site_flutter/controllers/menu_controller.dart';
import 'package:cc_site_flutter/constants/app_colors.dart';
import 'package:cc_site_flutter/models/menu_items.dart';

class NavBar extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());
  final List<Menu> menuItems;
  final ValueNotifier<Menu>? menuItemNotifier;

  NavBar({
    Key? key,
    required this.menuItems,
    this.menuItemNotifier,
  }) : super(key: key);

  int get menuItemIndex {
    final selectedMenuTitle = menuItemNotifier?.value.title;
    int index = menuItems
        .indexWhere((element) => element.toString() == selectedMenuTitle);
    return index > -1 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    // return Obx(
    //   () => Row(
    //     children: List.generate(
    //       _controller.navBarMenu.length,
    //       (index) => NavBarItem(
    //         text: _controller.navBarMenu[index].toString(),
    //         isActive: index == _controller.selectedIndex,
    //         press: () {
    //           _controller.setMenuIndex(index);
    //         },
    //       ),
    //     ),
    //   ),
    // );
    return Container(
      color: Colors.black87,
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          for (int i = 0; i < menuItems.length; i++)
            NavBarItem(
              text: _controller.navBarMenu[i].toString(),
              isActive: i == _controller.selectedIndex,
              press: () {
                _controller.setMenuIndex(i);
                menuItemNotifier?.value = Menu(
                  title: menuItems[i].toString(),
                  source: SelectionSource.fromButtonClick,
                );
              },
              menuItemNotifier: menuItemNotifier,
            ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatefulWidget {
  final bool isActive;
  final String text;
  final VoidCallback press;
  final ValueNotifier<Menu>? menuItemNotifier;

  const NavBarItem({
    Key? key,
    required this.isActive,
    required this.text,
    required this.press,
    this.menuItemNotifier,
  }) : super(key: key);

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
