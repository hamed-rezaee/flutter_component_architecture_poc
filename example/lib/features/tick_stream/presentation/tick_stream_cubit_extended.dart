import 'package:example/core/bloc_manager/selected_active_symbol_state_listener.dart';
import 'package:example/features/active_symbol/presentation/active_symbol_entity.dart';
import 'package:example/features/tick_stream/presentation/tick_stream_cubit.dart';

class TickStreamCubitExtended extends TickSteamCubit
    implements SelectedActiveSymbolStateListener {
  TickStreamCubitExtended(super.service);

  @override
  void onChanged({ActiveSymbolEntity? activeSymbol}) {
    if (activeSymbol != null) {
      fetchTickStream(activeSymbol);
    }
  }
}
