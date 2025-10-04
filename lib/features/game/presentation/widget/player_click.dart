import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/core/constants/app_asset.dart';

class PlayerClick extends StatelessWidget {
  final int index;
  final String symbol;
  final Function(int) onclick;

  const PlayerClick({
    super.key,
    required this.index,
    required this.symbol,
    required this.onclick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onclick(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        color: Colors.transparent,
        alignment: Alignment.center,
        child: symbol.isEmpty
            ? SizedBox()
            : symbol.toLowerCase() == 'o'
            ? SvgPicture.asset(AppAsset.oImage,height: 90.h,)
            : SvgPicture.asset(AppAsset.xImage,height: 90.h,),
      ),
    );
  }
}
