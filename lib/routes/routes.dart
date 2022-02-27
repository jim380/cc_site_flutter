import 'package:cc_site_flutter/pages/Home.dart';
import 'package:cc_site_flutter/pages/Project.dart';
import 'package:cc_site_flutter/pages/home/About.dart';
import 'package:cc_site_flutter/pages/home/Contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../pages/home/home.dart';
import 'package:fluro/fluro.dart';
import '../pages/Landing.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static Handler _landingPageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          Landing());

  static Handler _aboutHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          About());

  static Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          HomeView());

  static Handler _contactHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          Contact());

  static Handler _projectHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          Project());

  static void setupRouter() {
    router.define(
      '/',
      handler: _landingPageHandler,
    );
    router.define(
      '/Home',
      handler: _homeHandler,
      // transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/About',
      handler: _aboutHandler,
      // transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/Projects',
      handler: _projectHandler,
      // transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/Contact',
      handler: _contactHandler,
      // transitionType: TransitionType.fadeIn,
    );
  }
}
