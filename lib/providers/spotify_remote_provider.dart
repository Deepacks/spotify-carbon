import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotiflutter/spotiflutter.dart';

import '../models/track_model.dart';
import 'track_provider.dart';

final spotifyRemoteProvider = Provider<Spotiflutter>((ref) {
  final onTrackChange = ref.read(trackProvider.notifier).setTrack;

  return Spotiflutter((Map<dynamic, dynamic> trackData) {
    final track = Track(trackData['name'], trackData['artist']);

    onTrackChange(track);
  });
});
