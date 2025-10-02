import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/app_asset.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../cubit/setup_cubit.dart';
import '../widget/custom_drop_down.dart';
import '../widget/setup_form.dart';
import '../widget/random_button.dart';
import '../widget/show_first_player_and_symbol.dart';
import '../widget/start_game_button.dart';

class FriendSetupView extends StatefulWidget {
  const FriendSetupView({super.key});

  @override
  State<FriendSetupView> createState() => _FriendSetupViewState();
}

class _FriendSetupViewState extends State<FriendSetupView> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SetupCubit(),
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
                  AppStrings.setupFriend,
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
                              // Friend Form
                              SetupForm(
                                controllerPLayerOne: cubit.playerOneController,
                                controllerPLayerTwo: cubit.playerTwoController,
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

                              SizedBox(height: 25.h),
                              // Pick who plays first
                              Text(
                                AppStrings.pickWhoFirst,
                                style: TextStyles.font20WhiteBold,
                              ),
                              SizedBox(height: 8.h),
                              RandomButton(
                                onPressed: () {
                                  cubit.pickRandomFirstPlayer();
                                },
                                borderColor: state.showNameError
                                    ? AppColors.red
                                    : AppColors.transparent,
                              ),

                              if (state.showNameError)
                                Padding(
                                  padding: EdgeInsets.only(top: 8.h,left: 25.w),
                                  child: Text(
                                    AppStrings.nameRequired,
                                    style: TextStyles.font14RedMedium,
                                  ),
                                ),

                              SizedBox(height: 5.h),
                              if (state.randomClicked)
                                ShowFirstPlayerAndSymbol(
                                  textFirstPlayer: state.firstPlayer,
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
                        cubit.startGame();
                        //todo nav into game

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
