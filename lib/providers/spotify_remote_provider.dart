import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotiflutter/spotiflutter.dart';

import '../models/connection_state_model.dart';
import '../models/player_state_model.dart';
import '../models/track_model.dart';
import '../models/player_context_model.dart';

import 'connection_state_provider.dart';
import 'player_state_provider.dart';
import 'player_context_provider.dart';

final spotifyRemoteProvider = Provider<Spotiflutter>((ref) {
  void onConnectionEvent(Map<dynamic, dynamic> connectionEvent) {
    final onConnectionStateChange =
        ref.read(connectionStateProvider.notifier).setConnectionState;

    final connectionState = ConnectionState(
      connectionEvent["connected"],
      connectionEvent["statusMessage"],
      connectionEvent["errorCode"],
      connectionEvent["errorDetails"],
    );

    onConnectionStateChange(connectionState);
  }

  void onPlayerStateEvent(Map<dynamic, dynamic> playerStateEvent) {
    final onPlayerStateChange =
        ref.read(playerStateProvider.notifier).setPlayerState;

    final trackData = playerStateEvent['track'];
    final track = Track(trackData['name'], trackData['artist']);
    final playerState = PlayerState(playerStateEvent['isPaused'], track);

    onPlayerStateChange(playerState);
  }

  void onPlayerContextEvent(Map<dynamic, dynamic> playerContextEvent) {
    final onPlayerContextChange =
        ref.read(playerContextProvider.notifier).setPlayerContext;

    final playerContext = PlayerContext(
      playerContextEvent['title'],
      playerContextEvent['subtitle'],
      playerContextEvent['type'],
      playerContextEvent['uri'],
    );

    onPlayerContextChange(playerContext);
  }

  return Spotiflutter(
    onConnectionEvent,
    onPlayerStateEvent,
    onPlayerContextEvent,
  );
});
