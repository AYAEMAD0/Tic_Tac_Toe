import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/routing/routes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../setup/data/model/player_model.dart';
import '../cubit/game_cubit.dart';
import '../widget/line_horizontal.dart';
import '../widget/line_vertical.dart';
import '../widget/name_of_player_and_score.dart';
import '../widget/player_click.dart';

class GameView extends StatelessWidget {
  final PlayerModel player;

  const GameView({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit(player,isAI: player.isAi),
      child: BlocConsumer<GameCubit, GameState>(
        listener: (context, state) {
          if (state.message == AppStrings.gameFinished) {
            //todo nav into score
            final updatedPlayer = player.copyWith(
              firstPlayerScore: state.player1Score,
              secondPlayerScore: state.player2Score,
              winner: state.player1Score > state.player2Score
                  ? "first"
                  : state.player1Score < state.player2Score
                  ? "second"
                  : "draw",
            );
            Navigator.pushNamedAndRemoveUntil(context, Routes.scoreRouteName,(route) => false,arguments: updatedPlayer);
          }
        },
        builder: (context, state) {
          final gameState = state;
          final cubit = context.read<GameCubit>();
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.lightBlue, AppColors.darkBlue],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    children: [
                      NameOfPlayerAndScore(
                        player1Score: gameState.player1Score,
                        player2Score: gameState.player2Score,
                        player: player,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        gameState.message,
                        style: TextStyles.font26WhiteBold,
                      ),
                      SizedBox(height: 20.h),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(44.r),
                            color: AppColors.white,
                          ),
                          child: Column(
                            children: [
                              for (int row = 0; row < 3; row++) ...[
                                Expanded(
                                  child: Row(
                                    children: [
                                      for (int col = 0; col < 3; col++) ...[
                                        Expanded(
                                          child: PlayerClick(
                                            index: row * 3 + col,
                                            symbol:
                                                gameState.board[row * 3 + col],
                                            onclick: cubit.onClick,
                                          ),
                                        ),
                                        if (col < 2) LineVertical(),
                                      ],
                                    ],
                                  ),
                                ),
                                if (row < 2) LineHorizontal(),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
