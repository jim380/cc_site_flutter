import 'package:flutter/material.dart';
import 'package:cc_site_flutter/routes/router/app_config.dart';
import 'package:cc_site_flutter/models/menu_items.dart';

class SinglePageAppRouteInformationParser
    extends RouteInformationParser<AppConfiguration> {
  final List<Menu> menuItems;

  SinglePageAppRouteInformationParser(this.menuItems);

  @override
  Future<AppConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.length == 0) {
      return AppConfiguration.home();
    } else if (uri.pathSegments.length == 2) {
      final first = uri.pathSegments[0].toLowerCase();
      final second = uri.pathSegments[1].toLowerCase();
      if (first == 'menu_items' && _isValidMenuTitle(second)) {
        return AppConfiguration.home(menuTitle: second);
      } else {
        return AppConfiguration.unknown();
      }
    } else {
      return AppConfiguration.unknown();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(AppConfiguration configuration) {
    if (configuration.isUnknown) {
      return RouteInformation(location: '/unknown');
    } else if (configuration.isHomePage) {
      return RouteInformation(
        location: configuration.menuTitle == null
            ? '/'
            : '/menu_items/${configuration.menuTitle}',
      );
    } else if (configuration.isMainPage) {
      // final borderType =
      //     configuration.shapeBorderType.getStringRepresentation();
      final location = '/menu_items/${configuration.menuTitle}';
      return RouteInformation(location: location);
    } else {
      return null;
    }
  }

  bool _isValidMenuTitle(String menuItem) {
    final List<Menu> menuTitles = menuItems.toList();
    return menuTitles.contains("$menuItem");
  }
}
