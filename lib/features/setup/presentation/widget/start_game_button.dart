import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class StartGameButton extends StatelessWidget {
  const StartGameButton({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              onPressed: onPressed,
              backgroundColor: AppColors.fillTextFieldColor,
              text: AppStrings.startGame,
              styleText: TextStyles.font24DarkBlueBold,
              paddingHeight: 12.h,
            ),
          ],
        ),
      ),
    );
  }
}
