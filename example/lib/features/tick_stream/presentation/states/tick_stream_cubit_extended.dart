import 'package:example/core/enums.dart';
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

  void _onSelectedActiveSymbolChanged({String? activeSymbol}) {
    if (activeSymbol != null) {
      fetchTickStream(activeSymbol);
    }
  }

  void _handleConnectivtyState() {
    connectivityStatusStream.listen(
      (ConnectivityStatus connectivityStatus) {
        final bool reloadTickStream =
            connectivityStatus == ConnectivityStatus.connected &&
                state is TickStreamLoadedState;

        if (reloadTickStream) {
          _onSelectedActiveSymbolChanged(
            activeSymbol: (state as TickStreamLoadedState).tick.symbol,
          );
        }
      },
    );
  }

  void _handleActiveSymbolStates() {
    activeSymbolStateStream.listen(
      (SelectedActiveSymbolState activeSymbolState) {
        if (activeSymbolState is SelectedActiveSymbolUpdateState) {
          _onSelectedActiveSymbolChanged(
            activeSymbol: activeSymbolState.activeSymbol?.symbol,
          );
        }
      },
    );
  }
}
