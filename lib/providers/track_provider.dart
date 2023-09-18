import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrackNotifier extends Notifier<String> {
  @override
  String build() {
    return "";
  }

  void setTrack(String track) {
    state = track;
  }
}

final trackProvider = NotifierProvider<TrackNotifier, String>(
  () => TrackNotifier(),
);
