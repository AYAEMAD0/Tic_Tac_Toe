import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import 'custom_build_card.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.value,
    required this.items,
    required this.onchange,
  });
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onchange;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppStrings.numOfRound,
          style: TextStyles.font20WhiteBold,
        ),
        SizedBox(height: 10.h),
        CustomBuildCard(
          child: DropdownButton<T>(
            dropdownColor:AppColors.lightGrey,
            borderRadius: BorderRadius.circular(16.r),
            underline: const SizedBox.shrink(),
            isExpanded: true,
            value: value,
            items: items,
            onChanged: onchange,
          ),
        ),
      ],
    );
  }
}
