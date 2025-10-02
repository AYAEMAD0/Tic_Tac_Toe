import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';


class ChooseShapeForPlayer extends StatefulWidget {
  const ChooseShapeForPlayer({
    super.key,
    required this.textFirst,
    required this.onSymbolSelected,
  });

  final String textFirst;
  final void Function(String) onSymbolSelected;

  @override
  State<ChooseShapeForPlayer> createState() => _ChooseShapeForPlayerState();
}

class _ChooseShapeForPlayerState extends State<ChooseShapeForPlayer> {
  String playerOneSymbol = AppStrings.playerX;
  String playerTwoSymbol = AppStrings.playerO;

  void _selectSymbol(String symbol) {
    setState(() {
      playerOneSymbol = symbol;
      playerTwoSymbol = (symbol == AppStrings.playerX) ? AppStrings.playerO : AppStrings.playerX;
    });
    widget.onSymbolSelected(symbol);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.textFirst, style: TextStyles.font20WhiteBold),
        SizedBox(width: 10.w),
        Row(
          children: [
            Radio<String>(
              value: AppStrings.playerX,
              activeColor: AppColors.textColor,
              groupValue: playerOneSymbol,
              onChanged: (value) {
                if (value != null) _selectSymbol(value);
              },
            ),
            Text(AppStrings.playerX, style: TextStyles.font22WhiteBold),
            SizedBox(width: 40.w),
            Radio<String>(
              value: AppStrings.playerO,
              activeColor: AppColors.textColor,
              groupValue: playerOneSymbol,
              onChanged: (value) {
                if (value != null) _selectSymbol(value);
              },
            ),
            Text(AppStrings.playerO, style: TextStyles.font22WhiteBold),
          ],
        ),
      ],
    );
  }
}
