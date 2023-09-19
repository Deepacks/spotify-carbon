import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/track_model.dart';

class TrackNotifier extends Notifier<Track> {
  @override
  Track build() {
    return Track('', '');
  }

  void setTrack(Track track) {
    state = track;
  }
}

final trackProvider = NotifierProvider<TrackNotifier, Track>(
  () => TrackNotifier(),
);
