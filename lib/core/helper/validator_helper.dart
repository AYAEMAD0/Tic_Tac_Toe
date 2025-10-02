import '../constants/app_strings.dart';

class ValidatorHelper {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) return AppStrings.nameRequired;
    if (value.length < 3) return AppStrings.nameInvalid;
    return null;
  }
}
