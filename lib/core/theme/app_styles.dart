import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font22WhiteBold = GoogleFonts.montserrat(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.white,
  );
  static TextStyle font18BlackSemiBold = GoogleFonts.montserrat(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.black,
  );
  static TextStyle font20WhiteBold = GoogleFonts.montserrat(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.white,
  );
  static TextStyle font18GraySemiBold = GoogleFonts.montserrat(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.hintTextFieldColor,
  );
  static TextStyle font20WhiteSemiBold = GoogleFonts.montserrat(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.white,
  );
  static TextStyle font24DarkBlueBold = GoogleFonts.montserrat(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.darkBlue,
  );
  static TextStyle font14RedMedium = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.red,
  );
  static TextStyle font26WhiteSemiBold = GoogleFonts.montserrat(
    fontSize: 26.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.white,
  );
  static TextStyle font20DarkBlueBold = GoogleFonts.montserrat(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.darkBlue,
  );
}
