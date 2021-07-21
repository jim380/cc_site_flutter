import 'package:cc_site_flutter/models/menu_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cc_site_flutter/pages/unknown/unkown.dart';

import 'package:cc_site_flutter/pages/home/home.dart';
import 'package:cc_site_flutter/routes/router/app_config.dart';

class MainPage extends Page {
  final String menuItem;
  // final ShapeBorderType shapeBorderType;

  static const String routeName = "MainPage";

  @override
  String get name => routeName;

  MainPage({
    //@required this.shapeBorderType,
    required this.menuItem,
  });

  @override
  Route createRoute(BuildContext context) {
    return CupertinoDialogRoute(
      settings: this,
      barrierDismissible: true,
      barrierColor: Colors.black87,
      builder: (BuildContext context) => Text(
        "dummy text",
      ),
      context: context,
    );
  }
}

class SinglePageAppRouterDelegate extends RouterDelegate<AppConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppConfiguration> {
  final List<Menu> menuItems;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  Page? _homePage;

  // App state fields
  final ValueNotifier<Menu> _menuItemNotifier = ValueNotifier(Menu());
  // final ValueNotifier<ShapeBorderType> _shapeBorderTypeNotifier =
  //     ValueNotifier(null);
  // final ValueNotifier<Menu> menuItemNotifier1 = ValueNotifier(Menu());
  final ValueNotifier<bool> _unknownStateNotifier = ValueNotifier(false);

  SinglePageAppRouterDelegate({required this.menuItems}) {
    _homePage = MaterialPage(
      key: ValueKey<String>("HomePage"),
      child: HomeView(
        menuItems: menuItems,
        menuItemNotifier: _menuItemNotifier,
      ),
    );
    Listenable.merge([
      //_shapeBorderTypeNotifier,
      _unknownStateNotifier,
      _menuItemNotifier,
    ])
      ..addListener(() {
        print("notifying the router widget");
        notifyListeners();
      });
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  AppConfiguration get currentConfiguration {
    if (_unknownStateNotifier.value == true) {
      return AppConfiguration.unknown();
    } else {
      return AppConfiguration.home(
        menuTitle: _menuItemNotifier.value.title,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _unknownStateNotifier.value == true
          ? [
              MaterialPage(
                key: ValueKey<String>("Unknown"),
                child: UnknownScreen(),
              )
            ]
          : [
              _homePage!,
              // MainPage(
              //   colorCode: _menuTitleNotifier.value.title!,
              // ),
            ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        if (route.settings.name == MainPage.routeName) {
          //_shapeBorderTypeNotifier.value = null;
        }
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppConfiguration configuration) async {
    if (configuration.unknown) {
      _unknownStateNotifier.value = true;
      _menuItemNotifier.value = Menu();
    } else if (configuration.isHomePage) {
      _unknownStateNotifier.value = false;
      _menuItemNotifier.value = Menu(
        title: configuration.menuTitle,
        source: SelectionSource.fromBrowserAddressBar,
      );
    } else if (configuration.isMainPage) {
      _unknownStateNotifier.value = false;
      _menuItemNotifier.value = Menu(
        title: configuration.menuTitle,
        source: SelectionSource.fromBrowserAddressBar,
      );
    }
  }
}
