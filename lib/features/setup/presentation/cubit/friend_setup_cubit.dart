import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'friend_setup_state.dart';

class FriendSetupCubit extends Cubit<FriendSetupState> {
  FriendSetupCubit() : super(FriendSetupInitial());

  final playerOneController = TextEditingController();
  final playerTwoController = TextEditingController();

  void setPlayerName(int playerNumber, String name) {
    if (playerNumber == 1) {
      emit(state.copyWith(playerOneName: name));
    } else {
      emit(state.copyWith(playerTwoName: name));
    }
  }

  void setRounds(int value) {
    emit(state.copyWith(rounds: value));
  }

  void setSymbol(String symbol) {
    emit(state.copyWith(symbol: symbol));
  }

  void pickRandomFirstPlayer() {
    final p1 = playerOneController.text.trim();
    final p2 = playerTwoController.text.trim();

    if (p1.isEmpty || p2.isEmpty) {
      emit(state.copyWith(showNameError: true));
      return;
    }

    final first = (DateTime.now().microsecond % 2 == 0) ? p1 : p2;
    emit(state.copyWith(firstPlayer: first, randomClicked: true, showNameError: false));
  }

  void startGame() {
    final p1 = playerOneController.text.trim();
    final p2 = playerTwoController.text.trim();

    if (p1.isEmpty || p2.isEmpty) {
      emit(state.copyWith(showNameError: true));
      return;
    }

    final chosenRounds = state.rounds;
    final chosenFirst = state.firstPlayer.isNotEmpty ? state.firstPlayer : p1;
    final chosenSymbol = state.symbol.isNotEmpty ? state.symbol : 'X';

    emit(state.copyWith(
      playerOneName: p1,
      playerTwoName: p2,
      rounds: chosenRounds,
      firstPlayer: chosenFirst,
      symbol: chosenSymbol,
      showNameError: false,
    ));
  }
}
