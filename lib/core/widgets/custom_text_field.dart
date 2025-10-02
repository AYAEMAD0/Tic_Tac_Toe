import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';
import '../theme/app_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextStyle textStyle;
  final String hint;
  final TextStyle hintStyle;
  final String? label;
  final TextStyle? labelStyle;

  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final Color? suffixIconColor;

  final int maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboard;
  final bool? obscure;
  final String? obscureCharacter;
  final Function(String)? onChanged;
  final bool? isAi;
  const CustomTextField({
    super.key,
    required this.textStyle,
    required this.hint,
    required this.hintStyle,
    required this.controller,
    this.validator,
    this.maxLines = 1,
    this.keyboard,
    this.label,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconColor,
    this.prefixIconColor,
    this.obscure=false,
    this.obscureCharacter,
    this.onChanged,
    this.isAi,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      autofocus: false,
      readOnly: isAi??false,
      obscureText: obscure!,
      obscuringCharacter:obscureCharacter??"*" ,
      maxLines: maxLines,
      cursorColor: AppColors.darkBlue,
      cursorHeight: 25.h,
      cursorWidth: 3.w,
      keyboardType: keyboard ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle,
        labelText: label,
        labelStyle: labelStyle,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 18.h,
        ),
        enabledBorder: builtBorder(),
        focusedBorder: builtBorder(),
        errorBorder: builtBorder(isError:  true),
        focusedErrorBorder: builtBorder(isError:  true),
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        errorStyle: TextStyles.font14RedMedium,
        filled: true,
        fillColor: AppColors.fillTextFieldColor,
      ),
    );
  }

  OutlineInputBorder builtBorder({bool isError=false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(
        color: isError? AppColors.red:AppColors.fillTextFieldColor ,
        width: 2.w,
      ),
    );
  }
}
