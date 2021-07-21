import 'package:flutter/material.dart';
import 'package:cc_site_flutter/shared/section_title.dart';
import 'package:cc_site_flutter/shared/section_responsive_builder.dart';
import 'package:cc_site_flutter/constants/constants.dart';
import 'package:cc_site_flutter/models/services.dart';
import 'package:cc_site_flutter/models/menu_items.dart';
import 'package:flutter/foundation.dart';
import 'widgets/services_card.dart';
import 'dart:math';

class ServiceSection extends StatefulWidget {
  final List<Menu> menuItems;
  final ValueNotifier<Menu>? menuItemNotifier;

  ServiceSection({
    Key? key,
    required this.menuItems,
    this.menuItemNotifier,
  }) : super(key: key);

  @override
  State<ServiceSection> createState() => _ServiceSectionState();
}

class _ServiceSectionState extends State<ServiceSection> {
  final double _minItemHeight = 700;

  ScrollController _scrollController = ScrollController();

  double _calculateItemHeight({double? availableHeight}) {
    return max(availableHeight!, _minItemHeight);
  }

  int get _menuItemIndex {
    int index = widget.menuItems.indexWhere((element) {
      final menuItemTitle = widget.menuItemNotifier?.value.title;
      return element.toString() == menuItemTitle;
    });
    return index > -1 ? index : 0;
  }

  @override
  void initState() {
    super.initState();
    widget.menuItemNotifier?.addListener(() {
      final fromScroll =
          widget.menuItemNotifier?.value.source == SelectionSource.fromScroll;
      if (_scrollController.hasClients && !fromScroll) {
        _scrollToSection();
      }
    });
  }

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
        final itemHeight =
            _calculateItemHeight(availableHeight: constraints.maxHeight);
        _scrollController =
            ScrollController(initialScrollOffset: itemHeight * _menuItemIndex);
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is UserScrollNotification) {
              _onUserScroll(notification.metrics.pixels);
            }
            return true;
          },
          child: ListView.builder(
            controller: _scrollController,
            itemCount: widget.menuItems.length,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              //final title = widget.menuItems[index];
              return Container(
                height: itemHeight,
                // color: color.shade100,
                child: sectionResponsiveBuilder(
                    context, constraints, pageChildren, 2),
              );
            },
          ),
        );
      },
    );
  }

  void _onUserScroll(double offset) {
    final itemHeight = _calculateItemHeight(
        availableHeight: _scrollController.position.viewportDimension);
    final trailingIndex = (offset / itemHeight).floor();
    final menuItemTitle = widget.menuItems[trailingIndex].toString();
    widget.menuItemNotifier?.value = Menu(
      title: menuItemTitle,
      source: SelectionSource.fromScroll,
    );
  }

  void _scrollToSection() {
    final itemHeight =
        _calculateItemHeight(availableHeight: context.size?.height);
    final offset = _menuItemIndex * itemHeight;
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
