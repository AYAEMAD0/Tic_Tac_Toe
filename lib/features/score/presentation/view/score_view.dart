import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/core/routing/routes.dart';
import 'package:tic_tac_toe/core/widgets/custom_button.dart';
import 'package:tic_tac_toe/features/score/presentation/widget/info_score.dart';
import 'package:tic_tac_toe/features/setup/data/model/player_model.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../cubit/score_cubit.dart';

class ScoreView extends StatelessWidget {
  const ScoreView({super.key, required this.player});
  final PlayerModel player;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScoreCubit()..evaluateResult(player),
      child: BlocBuilder<ScoreCubit, ScoreState>(
        builder: (context, state) {
          final cubit = context.read<ScoreCubit>();

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.lightBlue, AppColors.darkBlue],
              ),
            ),
            child: Scaffold(
              backgroundColor: AppColors.transparent,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: AppColors.transparent,
                iconTheme: IconThemeData(color: AppColors.white),
                title: Text(
                  player.winner == 'draw'
                      ? AppStrings.gameOver
                      : "${state.winnerName} ${AppStrings.won}",
                  style: TextStyles.font26WhiteBold,
                ),
                centerTitle: true,
              ),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
                  child: Column(
                    children: [
                      if (player.isAi && state.lottiePath != null)
                        Lottie.asset(state.lottiePath!, height: 250.h)
                      else
                        Icon(
                          Icons.sports_esports_rounded,
                          size: 180.h,
                          color: Colors.white,
                        ),
                      const Spacer(flex: 2),
                      Text(
                        state.message,
                        style: TextStyles.font26WhiteBold,
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(flex: 3),
                      Row(
                        children: [
                          InfoScore(
                            name: state.winnerName,
                            score: state.winnerScore,
                            round: player.rounds,
                          ),
                          InfoScore(
                            name: state.loserName,
                            score: state.loserScore,
                            round: player.rounds,
                          ),
                        ],
                      ),
                      const Spacer(flex: 2),
                      Row(
                        spacing: 15.w,
                        children: [
                          Expanded(
                            child: CustomButton(
                              onPressed: () {
                                if (player.isAi) {
                                  Navigator.pushReplacementNamed(
                                      context, Routes.aiSetupRouteName);
                                } else {
                                  Navigator.pushReplacementNamed(
                                      context, Routes.friendSetupRouteName);
                                }
                              },
                              text: AppStrings.playAgain,
                              backgroundColor: AppColors.white,
                              styleText: TextStyles.font20DarkBlueBold,
                              paddingHeight: 13.h,
                            ),
                          ),
                          Expanded(
                            child: CustomButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, Routes.menuRouteName);
                              },
                              text: AppStrings.mainMenu,
                              backgroundColor: AppColors.white,
                              styleText: TextStyles.font20DarkBlueBold,
                              paddingHeight: 13.h,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
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
