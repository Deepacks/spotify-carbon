import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotiflutter/spotiflutter.dart';

import '../models/player_state_model.dart';
import '../models/track_model.dart';
import 'player_state_provider.dart';

final spotifyRemoteProvider = Provider<Spotiflutter>((ref) {
  final onPlayerStateChange =
      ref.read(playerStateProvider.notifier).setPlayerState;

  return Spotiflutter((Map<dynamic, dynamic> playerStateData) {
    final trackData = playerStateData['track'];

    final track = Track(trackData['name'], trackData['artist']);
    final playerState = PlayerState(playerStateData['isPaused'], track);

    onPlayerStateChange(playerState);
  });
});
