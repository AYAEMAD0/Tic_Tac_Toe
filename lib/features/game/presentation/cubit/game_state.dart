part of 'game_cubit.dart';

class GameState {
  final List<String> board;
  final String currentPlayer;
  final int player1Score;
  final int player2Score;
  final String message;
  final String winner;

  GameState({
    required this.board,
    required this.currentPlayer,
    required this.player1Score,
    required this.player2Score,
    required this.message,
    this.winner = "",
  });

  GameState copyWith({
    List<String>? board,
    String? currentPlayer,
    int? player1Score,
    int? player2Score,
    String? message,
    String? winner,
  }) {
    return GameState(
      board: board ?? this.board,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      player1Score: player1Score ?? this.player1Score,
      player2Score: player2Score ?? this.player2Score,
      message: message ?? this.message,
      winner: winner ?? this.winner,
    );
  }
}
