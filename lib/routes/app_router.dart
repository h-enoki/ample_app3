import 'package:ample_app3/models/Track.dart';
import 'package:ample_app3/views/home_page.dart';
import 'package:ample_app3/views/player_page.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return _buildRoute(MyHomePage());

      case AppRoutes.player:
        return _buildRoute(const PlayerPage());

      default:
        return null;
    }
  }

  static Route<dynamic>? _buildRoute(
    Widget child, {
    RouteSettings? settings,
    bool fullscreenDialog = false,
  }) {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => child,
      settings: settings,
      fullscreenDialog: fullscreenDialog,
    );
  }
}
