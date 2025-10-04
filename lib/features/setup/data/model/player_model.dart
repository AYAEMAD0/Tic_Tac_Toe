class PlayerModel {
  final String firstPlayerName;
  final String secondPlayerName;
  final String firstPlayerSymbol;
  final String secondPlayerSymbol;
  final int rounds;
  final bool isAi;
  PlayerModel({
    required this.firstPlayerName,
    required this.secondPlayerName,
    required this.firstPlayerSymbol,
    required this.secondPlayerSymbol,
    required this.rounds,
    this.isAi=false,
  });
}
