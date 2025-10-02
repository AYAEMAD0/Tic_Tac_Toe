part of 'friend_setup_cubit.dart';

class FriendSetupState {
  final String playerOneName;
  final String playerTwoName;
  final String firstPlayer;
  final int rounds;
  final bool showNameError;
  final bool randomClicked;
  final String symbol;

  FriendSetupState({
    required this.playerOneName,
    required this.playerTwoName,
    required this.firstPlayer,
    required this.rounds,
    this.showNameError = false,
    this.randomClicked = false,
    this.symbol = 'X',
  });

  FriendSetupState copyWith({
    String? playerOneName,
    String? playerTwoName,
    String? firstPlayer,
    int? rounds,
    bool? showNameError,
    bool? randomClicked,
    String? symbol,
  }) {
    return FriendSetupState(
      playerOneName: playerOneName ?? this.playerOneName,
      playerTwoName: playerTwoName ?? this.playerTwoName,
      firstPlayer: firstPlayer ?? this.firstPlayer,
      rounds: rounds ?? this.rounds,
      showNameError: showNameError ?? this.showNameError,
      randomClicked: randomClicked ?? this.randomClicked,
      symbol: symbol ?? this.symbol,
    );
  }
}

class FriendSetupInitial extends FriendSetupState {
  FriendSetupInitial()
      : super(
    playerOneName: '',
    playerTwoName: '',
    firstPlayer: '',
    rounds: 3,
    symbol: 'X',
  );
}
