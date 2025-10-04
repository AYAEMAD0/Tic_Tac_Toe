import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'setup_state.dart';

class SetupCubit extends Cubit<SetupState> {
  final bool isAi;
  SetupCubit({this.isAi = false}) : super(SetupInitial()) {
    if (isAi) {
      playerTwoController.text = "Computer";
      emit(state.copyWith(playerTwoName: "Computer"));
    }
  }

  final playerOneController = TextEditingController();
  final playerTwoController = TextEditingController();

  void setPlayerName(int playerNumber, String name) {
    if (playerNumber == 1) {
      emit(state.copyWith(playerOneName: name));
    } else {
      if (!isAi) {
        emit(state.copyWith(playerTwoName: name));
      }
    }
  }

  void setRounds(int value) {
    emit(state.copyWith(rounds: value));
  }

  void setSymbol(String symbol) {
    emit(state.copyWith(symbol: symbol));
  }
  String get secondPlayerSymbol => state.symbol == 'X' ? 'O' : 'X';
  String get secondPlayerGame => state.firstPlayer == playerOneController.text ? playerTwoController.text : playerOneController.text;

  void pickRandomFirstPlayer() {
    final p1 = playerOneController.text.trim();
    final p2 = playerTwoController.text.trim();

    if (p1.isEmpty || p2.isEmpty) {
      emit(state.copyWith(showNameError: true));
      return;
    }

    final first = (DateTime.now().microsecond % 2 == 0) ? p1 : p2;
    emit(
      state.copyWith(
        firstPlayer: first,
        randomClicked: true,
        showNameError: false,
      ),
    );
  }

  void startGame() {
    final p1 = playerOneController.text.trim();
    final p2 = playerTwoController.text.trim();

    if (p1.isEmpty || p2.isEmpty) {
      emit(state.copyWith(showNameError: true));
      return;
    }

    final chosenRounds = state.rounds;
    final chosenFirst = (state.firstPlayer != null && state.firstPlayer!.isNotEmpty)
        ? state.firstPlayer
        : p1;
    final chosenSymbol = state.symbol.isNotEmpty ? state.symbol : 'X';

    emit(
      state.copyWith(
        playerOneName: p1,
        playerTwoName: isAi ? "Computer" : p2,
        rounds: chosenRounds,
        firstPlayer: chosenFirst,
        symbol: chosenSymbol,
        showNameError: false,
      ),
    );
  }
}
