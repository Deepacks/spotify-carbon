class ConnectionState {
  final bool connected;
  final String statusMessage;
  final String? errorCode;
  final String? errorDetails;

  ConnectionState(
    this.connected,
    this.statusMessage,
    this.errorCode,
    this.errorDetails,
  );
}
