import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class ChooseShapeForPlayer extends StatefulWidget {
  const ChooseShapeForPlayer({
    super.key,
    this.textFirst,
    required this.onSymbolSelected,
    this.controller,
  });

  final String? textFirst;
  final void Function(String) onSymbolSelected;
  final TextEditingController? controller;
  @override
  State<ChooseShapeForPlayer> createState() => _ChooseShapeForPlayerState();
}

class _ChooseShapeForPlayerState extends State<ChooseShapeForPlayer> {
  String playerOneSymbol = AppStrings.playerX;
  String playerTwoSymbol = AppStrings.playerO;

  void _selectSymbol(String symbol) {
    setState(() {
      playerOneSymbol = symbol;
      playerTwoSymbol = (symbol == AppStrings.playerX)
          ? AppStrings.playerO
          : AppStrings.playerX;
    });
    widget.onSymbolSelected(symbol);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.textFirst != null
            ? Text(
                "${widget.textFirst} :",
                style: TextStyles.font20WhiteBold,
                overflow: TextOverflow.ellipsis,
              )
            : ValueListenableBuilder<TextEditingValue>(
                valueListenable: widget.controller!,
                builder: (context, value, _) {
                  final name = value.text.trim();
                  return Text(
                    name.isNotEmpty ? "$name :" : "${AppStrings.playerOne} :",
                    style: TextStyles.font20WhiteBold,
                    overflow: TextOverflow.ellipsis,
                  );
                },
              ),

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
