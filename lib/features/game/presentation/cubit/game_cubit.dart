import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/core/constants/app_strings.dart';
import '../../../setup/data/model/player_model.dart';
part 'game_state.dart';
class GameCubit extends Cubit<GameState> {
  final PlayerModel player;
  int currentRound = 1;

  GameCubit(this.player)
      : super(
    GameState(
      board: List.filled(9, ''),
      currentPlayer: player.firstPlayerSymbol,
      player1Score: 0,
      player2Score: 0,
      message: "${player.firstPlayerName}${AppStrings.turn}",
    ),
  );

  void onClick(int index) {
    if (state.board[index].isNotEmpty) return;

    final newBoard = List<String>.from(state.board);
    newBoard[index] = state.currentPlayer;

    if (win(state.currentPlayer, newBoard)) {
      final newMessage = state.currentPlayer == player.firstPlayerSymbol
          ? '${player.firstPlayerName} ${AppStrings.win}'
          : '${player.secondPlayerName} ${AppStrings.win}';

      final newPlayer1Score = state.currentPlayer == player.firstPlayerSymbol
          ? state.player1Score + 1
          : state.player1Score;
      final newPlayer2Score = state.currentPlayer == player.secondPlayerSymbol
          ? state.player2Score + 1
          : state.player2Score;

      emit(state.copyWith(
        board: newBoard,
        player1Score: newPlayer1Score,
        player2Score: newPlayer2Score,
        message: newMessage,
      ));

      Future.delayed(const Duration(seconds: 1), nextRound);
      return;
    }

    if (!newBoard.contains('')) {
      emit(state.copyWith(board: newBoard, message: AppStrings.nonePlayersWin));
      Future.delayed(const Duration(seconds: 1), nextRound);
      return;
    }

    final nextPlayer = state.currentPlayer == player.firstPlayerSymbol
        ? player.secondPlayerSymbol
        : player.firstPlayerSymbol;

    final nextMessage = nextPlayer == player.firstPlayerSymbol
        ? "${player.firstPlayerName}${AppStrings.turn}"
        : "${player.secondPlayerName}${AppStrings.turn}";

    emit(state.copyWith(
      board: newBoard,
      currentPlayer: nextPlayer,
      message: nextMessage,
    ));
  }

  void nextRound() {
    if (currentRound >= player.rounds) {
      emit(state.copyWith(message: AppStrings.gameFinished));
      return;
    }

    currentRound++;
    emit(state.copyWith(
      board: List.filled(9, ''),
      currentPlayer: player.firstPlayerSymbol,
      message: "${player.firstPlayerName}${AppStrings.turn}",
    ));
  }

  bool win(String symbol, List<String> board) {
    List<List<int>> winConditions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var c in winConditions) {
      if (board[c[0]] == symbol &&
          board[c[1]] == symbol &&
          board[c[2]] == symbol) {
        return true;
      }
    }
    return false;
  }
}
