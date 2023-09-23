import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_carbon/models/player_context_model.dart';

class PlayerContextNotifier extends Notifier<PlayerContext> {
  @override
  PlayerContext build() {
    return PlayerContext("", "", "", "");
  }

  void setPlayerContext(PlayerContext playerContext) {
    state = playerContext;
  }
}

final playerContextProvider =
    NotifierProvider<PlayerContextNotifier, PlayerContext>(
  () => PlayerContextNotifier(),
);
