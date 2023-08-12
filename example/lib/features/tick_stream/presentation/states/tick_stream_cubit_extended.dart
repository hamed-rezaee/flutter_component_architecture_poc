import 'package:example/core/enums.dart';
import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';
import 'package:example/features/active_symbol/presentation/states/selected_active_symbol_cubit.dart';
import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit.dart';

class TickStreamCubitExtended extends TickSteamCubit {
  TickStreamCubitExtended(
    super.service,
    this.connectivityStatusStream,
    this.activeSymbolStateStream,
  ) {
    _handleConnectivtyState();
    _handleActiveSymbolStates();
  }

  final Stream<ConnectivityStatus> connectivityStatusStream;

  final Stream<SelectedActiveSymbolState> activeSymbolStateStream;

  void _onSelectedActiveSymbolChanged({ActiveSymbolEntity? activeSymbol}) {
    if (activeSymbol != null) {
      fetchTickStream(activeSymbol);
    }
  }

  void _handleConnectivtyState() {
    connectivityStatusStream.listen(
      (ConnectivityStatus connectivityStatus) {
        switch (connectivityStatus) {
          case ConnectivityStatus.connected:
            // TODO: handle reconnect
            break;
          case ConnectivityStatus.connecting:
            break;
        }
      },
    );
  }

  void _handleActiveSymbolStates() {
    activeSymbolStateStream.listen(
      (SelectedActiveSymbolState activeSymbolState) {
        switch (activeSymbolState) {
          case SelectedActiveSymbolUpdateState():
            _onSelectedActiveSymbolChanged(
              activeSymbol: activeSymbolState.activeSymbol,
            );
        }
      },
    );
  }
}
