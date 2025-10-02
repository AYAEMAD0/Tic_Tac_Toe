import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tic_tac_toe/core/constants/app_asset.dart';
import 'package:tic_tac_toe/core/constants/app_strings.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_styles.dart';
import '../widget/card_menu.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AppAsset.backgroundImage,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(AppStrings.gameMode, style: TextStyles.font22WhiteBold),
                SizedBox(height: 17.h),
                Row(
                  spacing: 12.w,
                  children: [
                    Expanded(
                      child: CardMenu(
                        icon: FontAwesomeIcons.userGroup,
                        text: AppStrings.playFriend,
                        onPressed: () {
                          Navigator.pushNamed(context,Routes.friendSetupRouteName);
                        },
                      ),
                    ),

                    Expanded(
                      child: CardMenu(
                        icon: FontAwesomeIcons.robot,
                        text: AppStrings.playAi,
                        onPressed: () {
                           Navigator.pushNamed(context,Routes.aiSetupRouteName);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
