import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/connection_state_model.dart';

class ConnectionStateNotifier extends Notifier<ConnectionState> {
  @override
  ConnectionState build() {
    return ConnectionState(false, "No event registered yet", null, null);
  }

  void setConnectionState(ConnectionState connectionState) {
    state = connectionState;
  }
}

final connectionStateProvider =
    NotifierProvider<ConnectionStateNotifier, ConnectionState>(
  () => ConnectionStateNotifier(),
);
