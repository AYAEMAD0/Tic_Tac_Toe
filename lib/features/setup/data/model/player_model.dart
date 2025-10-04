class PlayerModel {
  final String firstPlayerName;
  final String secondPlayerName;
  final String firstPlayerSymbol;
  final String secondPlayerSymbol;
  final int rounds;
  final bool isAi;
  final String? winner;
  final int? firstPlayerScore;
  final int? secondPlayerScore;

  PlayerModel({
    required this.firstPlayerName,
    required this.secondPlayerName,
    required this.firstPlayerSymbol,
    required this.secondPlayerSymbol,
    required this.rounds,
    this.isAi = false,
    this.firstPlayerScore,
    this.secondPlayerScore,
    this.winner,
  });

  PlayerModel copyWith({
    String? firstPlayerName,
    String? secondPlayerName,
    String? firstPlayerSymbol,
    String? secondPlayerSymbol,
    int? rounds,
    bool? isAi,
    String? winner,
    int? firstPlayerScore,
    int? secondPlayerScore,
  }) {
    return PlayerModel(
      firstPlayerName: firstPlayerName ?? this.firstPlayerName,
      secondPlayerName: secondPlayerName ?? this.secondPlayerName,
      firstPlayerSymbol: firstPlayerSymbol ?? this.firstPlayerSymbol,
      secondPlayerSymbol: secondPlayerSymbol ?? this.secondPlayerSymbol,
      rounds: rounds ?? this.rounds,
      isAi: isAi ?? this.isAi,
      winner: winner ?? this.winner,
      firstPlayerScore: firstPlayerScore ?? this.firstPlayerScore,
      secondPlayerScore: secondPlayerScore ?? this.secondPlayerScore,
    );
  }
}
