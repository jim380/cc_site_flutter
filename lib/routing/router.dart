import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../routing/route_names.dart';
import '../sections/portfolio/portfolio_section.dart';
// import 'package:the_basics/views/episode_details/episode_details.dart';
// import 'package:the_basics/views/episodes/episodes_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PortfolioRoute:
      return _getPageRoute(PortfolioSection(), settings);
    //case PortfolioRoute:
    //return _getPageRoute(AboutView(), settings);
    // case EpisodesRoute:
    //   return _getPageRoute(EpisodesView(), settings);
    // case EpisodeDetailsRoute:
    //   return _getPageRoute(EpisodeDetails(), settings);
    default:
    //return _getPageRoute(HomeView(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
