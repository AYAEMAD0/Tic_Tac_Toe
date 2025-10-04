import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_styles.dart';
import 'choose_shape_for_player.dart';

class ShowFirstPlayerAndSymbol extends StatelessWidget {
  const ShowFirstPlayerAndSymbol({
    super.key,
    required this.textFirstPlayer,
    required this.onSymbolSelected,
  });
  final String textFirstPlayer;
  final void Function(String) onSymbolSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "$textFirstPlayer 🎉",
            style: TextStyles.font20WhiteSemiBold,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20.h),
        Text(AppStrings.pickSymbol, style: TextStyles.font20WhiteSemiBold),
        SizedBox(height: 5.h),
        ChooseShapeForPlayer(
          textFirst: textFirstPlayer,
          onSymbolSelected: onSymbolSelected,
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
