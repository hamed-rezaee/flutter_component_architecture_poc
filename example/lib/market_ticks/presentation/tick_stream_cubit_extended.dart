import '../../core/state_listeners/connectivity_state_listener.dart';
import 'tick_stream_cubit.dart';

class TickStreamCubitExtended extends TickSteamCubit
    implements ConnectivityStateListener {
  TickStreamCubitExtended(super.service);

  @override
  void onConnectivityChanged({required bool isConnected}) =>
      print('isConnected: $isConnected');
}
