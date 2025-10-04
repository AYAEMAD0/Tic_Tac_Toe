import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_styles.dart';

class InfoScore extends StatelessWidget {
  const InfoScore({super.key, required this.name, required this.score, required this.round});

  final String name;
  final int score;
  final int round;
  @override
  Widget build(BuildContext context) {
    return
      Expanded(
      child: Column(
      spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyles.font22WhiteSemiBold,
          ),
          SizedBox(height: 13.h),
          Text(
            '${AppStrings.score}: $score',
            style: TextStyles.font22WhiteSemiBold,
          ),
          Text(
            '${AppStrings.round}: $round',
            style: TextStyles.font22WhiteSemiBold,
          ),
        ],
      ));
  }
}
