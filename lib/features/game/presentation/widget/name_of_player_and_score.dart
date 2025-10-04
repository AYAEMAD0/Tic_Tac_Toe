import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../setup/data/model/player_model.dart';

class NameOfPlayerAndScore extends StatelessWidget {
  const NameOfPlayerAndScore({
    super.key,
    required this.player1Score,
    required this.player2Score,
    required this.player
  });
  final int player1Score, player2Score;
  final PlayerModel player;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(35.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${player.firstPlayerName} (${player.firstPlayerSymbol})',
                style: TextStyles.font20DarkBlueBold,
              ),
              Text(
                '$player1Score',
                style:TextStyles.font20DarkBlueBold,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '${player.secondPlayerName} (${player.secondPlayerSymbol})',
                style: TextStyles.font20DarkBlueBold,
              ),
              Text(
                '$player2Score',
                style: TextStyles.font20DarkBlueBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
