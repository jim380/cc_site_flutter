import 'package:cc_site_flutter/pages/about/about.dart';
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
          HomeView());

  static Handler _blogHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          HomeView());

  static Handler _contactHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          HomeView());

  static Handler _resumeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          HomeView());

  static void setupRouter() {
    router.define(
      '/',
      handler: _landingPageHandler,
    );
    router.define(
      '/About',
      handler: _aboutHandler,
      // transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/Blog',
      handler: _blogHandler,
      // transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/Contact',
      handler: _contactHandler,
      // transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/Resume',
      handler: _resumeHandler,
      // transitionType: TransitionType.fadeIn,
    );
  }
}
