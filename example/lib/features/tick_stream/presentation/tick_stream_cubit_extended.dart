import 'package:example/core/state_listeners/state_listener.dart';
import 'package:example/features/tick_stream/presentation/tick_stream_cubit.dart';

class TickStreamCubitExtended extends TickSteamCubit implements StateListener {
  TickStreamCubitExtended(super.service);

  @override
  void onChanged({required bool isConnected}) =>
      print('isConnected: $isConnected');
}
