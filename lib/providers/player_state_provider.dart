import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/player_state_model.dart';
import '../models/track_model.dart';

class PlayerStateNotifier extends Notifier<PlayerState> {
  @override
  PlayerState build() {
    return PlayerState(true, Track('', ''));
  }

  void setPlayerState(PlayerState playerState) {
    state = playerState;
  }
}

final playerStateProvider = NotifierProvider<PlayerStateNotifier, PlayerState>(
  () => PlayerStateNotifier(),
);
