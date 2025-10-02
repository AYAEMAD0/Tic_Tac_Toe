import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/validator_helper.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/custom_text_field.dart';


class CustomNameTextField extends StatelessWidget {
  const CustomNameTextField({
    super.key,
    required this.text,
    required this.controller,
    required this.onChanged,
    required this.hint,
    this.isAi,
  });
  final String text;
  final String hint;
  final TextEditingController controller;
  final dynamic Function(String) onChanged;
  final bool? isAi;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(text, style: TextStyles.font20WhiteBold),
        SizedBox(height: 8.h),
        CustomTextField(
          textStyle: TextStyles.font18GraySemiBold,
          hint: hint,
          isAi: isAi??false,
          hintStyle: TextStyles.font18GraySemiBold,
          controller: controller,
          onChanged: onChanged,
          validator: ValidatorHelper.validateName,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
