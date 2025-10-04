part of 'setup_cubit.dart';

class SetupState {
  final String playerOneName;
  final String playerTwoName;
  final String? firstPlayer;
  final int rounds;
  final bool showNameError;
  final bool randomClicked;
  final String symbol;

  SetupState({
    required this.playerOneName,
    required this.playerTwoName,
    required this.rounds,
    this.showNameError = false,
    this.randomClicked = false,
    this.firstPlayer,
    this.symbol = 'X',
  });

  SetupState copyWith({
    String? playerOneName,
    String? playerTwoName,
    String? firstPlayer,
    int? rounds,
    bool? showNameError,
    bool? randomClicked,
    String? symbol,
  }) {
    return SetupState(
      playerOneName: playerOneName ?? this.playerOneName,
      playerTwoName: playerTwoName ?? this.playerTwoName,
      firstPlayer: firstPlayer ?? this.playerOneName,
      rounds: rounds ?? this.rounds,
      showNameError: showNameError ?? this.showNameError,
      randomClicked: randomClicked ?? this.randomClicked,
      symbol: symbol ?? this.symbol,
    );
  }
}

class SetupInitial extends SetupState {
  SetupInitial()
    : super(
        playerOneName: '',
        playerTwoName: '',
        firstPlayer: '',
        rounds: 3,
        symbol: 'X',
      );
}
