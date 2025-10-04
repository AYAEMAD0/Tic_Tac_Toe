import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';

class LineHorizontal extends StatelessWidget {
  const LineHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2.h,
      child: Divider(color: AppColors.black, thickness: 1),
    );
  }
}
