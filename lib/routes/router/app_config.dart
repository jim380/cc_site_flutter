class AppConfiguration {
  final String? menuTitle;

  ///final ShapeBorderType shapeBorderType;
  final bool unknown;

  AppConfiguration.home({String? menuTitle})
      : unknown = false,
        //shapeBorderType = null,
        menuTitle = menuTitle;

  // AppConfiguration.shapeBorder(String menuTitle)
  //     : unknown = false,
  //       shapeBorderType = shape,
  //       menuTitle = menuTitle;

  AppConfiguration.unknown()
      : unknown = true,
        //shapeBorderType = null,
        menuTitle = null;

  bool get isUnknown => unknown == true;

  bool get isHomePage => unknown == false;

  bool get isMainPage => unknown == false && menuTitle != null;
}
