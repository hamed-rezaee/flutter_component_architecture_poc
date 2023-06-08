/// An abstract class that has to be implemented by the state listeners.
abstract class StateListener {
  /// On changed event.
  void onChanged({required bool isConnected});
}
