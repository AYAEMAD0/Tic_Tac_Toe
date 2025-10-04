import 'package:flutter/material.dart';
import 'package:tic_tac_toe/features/game/presentation/view/game_view.dart';
import 'package:tic_tac_toe/features/score/presentation/view/score_view.dart';
import 'package:tic_tac_toe/features/setup/data/model/player_model.dart';
import 'package:tic_tac_toe/features/setup/presentation/view/ai_setup_view.dart';
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
    case Routes.aiSetupRouteName:
        return MaterialPageRoute(builder: (_) => AiSetupView());
    case Routes.gameRouteName:
      final args=settings.arguments as PlayerModel;
        return MaterialPageRoute(builder: (_) => GameView(player: args,));
    case Routes.scoreRouteName:
      final args=settings.arguments as PlayerModel;
        return MaterialPageRoute(builder: (_) => ScoreView(player:args,));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
