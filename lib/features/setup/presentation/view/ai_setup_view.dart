import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_asset.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../cubit/setup_cubit.dart';
import '../widget/choose_shape_for_player.dart';
import '../widget/custom_drop_down.dart';
import '../widget/setup_form.dart';
import '../widget/start_game_button.dart';
import '../../data/model/player_model.dart';
import 'package:tic_tac_toe/core/routing/routes.dart';

class AiSetupView extends StatefulWidget {
  const AiSetupView({super.key});

  @override
  State<AiSetupView> createState() => _AiSetupViewState();
}

class _AiSetupViewState extends State<AiSetupView> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SetupCubit(isAi: true),
      child: BlocBuilder<SetupCubit, SetupState>(
        builder: (context, state) {
          final cubit = context.read<SetupCubit>();
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: AppColors.transparent,
                iconTheme: IconThemeData(color: AppColors.white),
                title: Text(
                  AppStrings.setupAi,
                  style: TextStyles.font22WhiteBold,
                ),
                centerTitle: true,
              ),
              body: Stack(
                children: [
                  //background
                  SvgPicture.asset(
                    AppAsset.backgroundWithoutTextImage,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 18.h,
                    ),
                    child: SafeArea(
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Ai Form
                              SetupForm(
                                controllerPLayerOne: cubit.playerOneController,
                                controllerPLayerTwo: cubit.playerTwoController,
                                isAi: true,
                                onChangedOne: (value) =>
                                    cubit.setPlayerName(1, value),
                                onChangedTwo: (value) =>
                                    cubit.setPlayerName(2, value),
                              ),

                              // Rounds dropdown
                              CustomDropDown<int>(
                                value: state.rounds,
                                items: const [
                                  DropdownMenuItem(
                                    value: 3,
                                    child: Text(AppStrings.rounds3),
                                  ),
                                  DropdownMenuItem(
                                    value: 5,
                                    child: Text(AppStrings.rounds5),
                                  ),
                                  DropdownMenuItem(
                                    value: 10,
                                    child: Text(AppStrings.rounds10),
                                  ),
                                ],
                                onchange: (value) {
                                  if (value != null) cubit.setRounds(value);
                                },
                              ),

                              SizedBox(height: 5.h),
                              ChooseShapeForPlayer(
                                controller: cubit.playerOneController,
                                onSymbolSelected: cubit.setSymbol,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Start Game button
                  StartGameButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        cubit.setPlayerName(1, cubit.playerOneController.text);
                        cubit.setSymbol(
                          cubit.state.symbol.isEmpty
                              ? AppStrings.playerX
                              : cubit.state.symbol,
                        );

                        cubit.startGame();

                        Navigator.pushReplacementNamed(
                          context,
                          Routes.gameRouteName,
                          arguments: PlayerModel(
                            firstPlayerName: cubit.playerOneController.text,
                            secondPlayerName: cubit.secondPlayerGame,
                            firstPlayerSymbol: cubit.state.symbol,
                            secondPlayerSymbol: cubit.secondPlayerSymbol,
                            rounds: cubit.state.rounds,
                            isAi: true,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
