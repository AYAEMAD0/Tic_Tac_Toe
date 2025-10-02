import 'package:flutter/material.dart';
import '../../../../../core/constants/app_strings.dart';
import 'custom_name_text_field.dart';

class FriendSetupForm extends StatelessWidget {
  const FriendSetupForm({
    super.key,
    required this.controllerPLayerOne,
    required this.controllerPLayerTwo, required this.onChangedOne,
    required this.onChangedTwo,
  });
  final TextEditingController controllerPLayerOne;
  final TextEditingController controllerPLayerTwo;
  final dynamic Function(String) onChangedOne;
  final dynamic Function(String) onChangedTwo;
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
          text: AppStrings.namePlayer2,
          hint: AppStrings.playerTwo,
          controller:controllerPLayerTwo,
          onChanged: onChangedTwo,
        ),
      ],
    );
  }
}
