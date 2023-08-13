import 'package:example/core/enums.dart';
import 'package:example/features/active_symbol/presentation/states/selected_active_symbol_cubit.dart';
import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit.dart';

class TickStreamCubitExtended extends TickSteamCubit {
  TickStreamCubitExtended(
    super.service,
    this.connectivityStatusStream,
    this.selectedActiveSymbolStateStream,
  ) {
    _handleConnectivtyState();
    _handleSelectedActiveSymbolStates();
  }

  final Stream<ConnectivityStatus> connectivityStatusStream;
  final Stream<SelectedActiveSymbolState> selectedActiveSymbolStateStream;

  void _onSelectedActiveSymbolChanged({String? activeSymbol}) {
    fetchTickStream(activeSymbol);
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

  void _handleSelectedActiveSymbolStates() {
    selectedActiveSymbolStateStream.listen(
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
