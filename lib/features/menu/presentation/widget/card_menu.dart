import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class CardMenu extends StatelessWidget {
  const CardMenu({super.key,required this.onPressed, required this.icon, required this.text});

  final IconData icon;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        padding: EdgeInsets.symmetric(vertical: 30.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(25.r),
        ),
      ),
      child:Column(
        children: [
          Icon(icon, size: 30,color: AppColors.darkBlue,),
          SizedBox(height: 10.h,),
          Text(
           text,
            style: TextStyles.font18BlackSemiBold,
          ),
        ],
      ),
    );
  }
}
