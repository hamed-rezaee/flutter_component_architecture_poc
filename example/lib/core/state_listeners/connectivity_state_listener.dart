/// Defines the interface for the connectivity state listeners.
abstract class ConnectivityStateListener {
  void onConnectivityChanged({required bool isConnected});
}
