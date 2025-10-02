import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class RandomButton extends StatelessWidget {
  const RandomButton({super.key, required this.onPressed, required this.borderColor});
  final void Function() onPressed;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      backgroundColor: AppColors.fillTextFieldColor,
      borderColor: borderColor,
      paddingHeight: 15.h,
      isIcon: true,
      iconWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 15.w,
        children: [
          Icon(
            Icons.casino,
            color: AppColors.hintTextFieldColor,
            size: 30,
          ),
          Text(
            AppStrings.random,
            style: TextStyles.font18GraySemiBold,
          ),
        ],
      ),
    );
  }
}
