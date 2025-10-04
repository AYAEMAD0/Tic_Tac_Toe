import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';

class LineVertical extends StatelessWidget {
  const LineVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 2.w,
      child: VerticalDivider(color: AppColors.black, thickness: 1),
    );
  }
}
