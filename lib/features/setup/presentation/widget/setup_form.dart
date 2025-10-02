import 'package:flutter/material.dart';
import '../../../../../core/constants/app_strings.dart';
import 'custom_name_text_field.dart';

class SetupForm extends StatelessWidget {
  const SetupForm({
    super.key,
    required this.controllerPLayerOne,
    required this.controllerPLayerTwo, required this.onChangedOne,
    required this.onChangedTwo,
    this.isAi=false,
  });
  final TextEditingController controllerPLayerOne;
  final TextEditingController controllerPLayerTwo;
  final dynamic Function(String) onChangedOne;
  final dynamic Function(String) onChangedTwo;
  final bool isAi;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Player 1
        CustomNameTextField(
          text: AppStrings.namePlayer1,
          hint: AppStrings.playerOne,
          controller: controllerPLayerOne,
          onChanged: onChangedOne,
        ),
        // Player 2
        CustomNameTextField(
          isAi: isAi,
          text: AppStrings.namePlayer2,
          hint: AppStrings.playerTwo,
          controller:controllerPLayerTwo,
          onChanged: onChangedTwo,
        ),
      ],
    );
  }
}
