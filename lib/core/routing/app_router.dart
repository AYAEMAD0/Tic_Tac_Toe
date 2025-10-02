import 'package:flutter/material.dart';
import '../../features/menu/presentation/view/menu_view.dart';
import '../../features/setup/presentation/view/friend_setup_view.dart';
import 'routes.dart';

class AppRouter {
   Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.menuRouteName:
        return MaterialPageRoute(builder: (_) => MenuView());
    case Routes.friendSetupRouteName:
        return MaterialPageRoute(builder: (_) => FriendSetupView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
