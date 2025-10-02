import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
     this.text,
     this.styleText,
    this.isIcon = false,
    this.borderColor,
    this.paddingHeight,
    this.foregroundColor,
    this.iconWidget,
  });
  final void Function() onPressed;
  final Color backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final bool isIcon;
  final String? text;
  final TextStyle? styleText;
  final double? paddingHeight;
  final Widget? iconWidget;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor:foregroundColor ,
        minimumSize:Size(double.infinity, 50.h),
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical:paddingHeight?? 0.015.h,horizontal: 0.03.w ),
        side:BorderSide(color: borderColor??AppColors.transparent,width: 1.5.w) ,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      ),
      child: isIcon
          ? iconWidget
          : Text(text!, style: styleText),
    );
  }
}
