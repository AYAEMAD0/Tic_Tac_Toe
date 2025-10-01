import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font24WhiteExtraBold = GoogleFonts.montserrat(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.white,
  );
}
