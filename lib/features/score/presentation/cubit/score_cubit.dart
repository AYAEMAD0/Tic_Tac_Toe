import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_asset.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../setup/data/model/player_model.dart';
part 'score_state.dart';


class ScoreCubit extends Cubit<ScoreState> {
  ScoreCubit() : super(
    const ScoreState(
      message: '',
      winnerName: '',
      loserName: '',
      winnerScore: 0,
      loserScore: 0,
    ),
  );

  void evaluateResult(PlayerModel player) {
    String message = '';
    String? lottiePath;
    String winnerName = '';
    String loserName = '';
    int winnerScore = 0;
    int loserScore = 0;

    if (player.winner == 'first') {
      message = '${player.firstPlayerName} ${AppStrings.messageWin}';
      winnerName = player.firstPlayerName;
      loserName = player.secondPlayerName;
      winnerScore = player.firstPlayerScore ?? 0;
      loserScore = player.secondPlayerScore ?? 0;
      lottiePath = AppAsset.happyBoy;
    } else if (player.winner == 'second') {
      if (player.isAi) {
        message = '${player.firstPlayerName} ${AppStrings.messageLose}';
        lottiePath = AppAsset.sadBoy;
      } else {
        message = '${player.secondPlayerName} ${AppStrings.messageWin}';
      }
      winnerName = player.secondPlayerName;
      loserName = player.firstPlayerName;
      winnerScore = player.secondPlayerScore ?? 0;
      loserScore = player.firstPlayerScore ?? 0;
    } else if (player.winner == 'draw') {
      message = AppStrings.messageNoPlayerWin;
      lottiePath = AppAsset.handshake;
      winnerName = player.firstPlayerName;
      loserName = player.secondPlayerName;
      winnerScore = player.firstPlayerScore ?? 0;
      loserScore = player.secondPlayerScore ?? 0;
    }

    emit(ScoreState(
      message: message,
      lottiePath: lottiePath,
      winnerName: winnerName,
      loserName: loserName,
      winnerScore: winnerScore,
      loserScore: loserScore,
    ));
  }
}
