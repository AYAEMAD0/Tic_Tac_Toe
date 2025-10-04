part of 'score_cubit.dart';

class ScoreState extends Equatable {
  final String message;
  final String? lottiePath;
  final String winnerName;
  final String loserName;
  final int winnerScore;
  final int loserScore;

  const ScoreState({
    required this.message,
    this.lottiePath,
    required this.winnerName,
    required this.loserName,
    required this.winnerScore,
    required this.loserScore,
  });

  @override
  List<Object?> get props => [message, lottiePath, winnerName, loserName, winnerScore, loserScore];
}
