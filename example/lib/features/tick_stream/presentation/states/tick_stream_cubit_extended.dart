import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';
import 'package:example/features/active_symbol/presentation/states/selected_active_symbol_cubit.dart';
import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit.dart';

class TickStreamCubitExtended extends TickSteamCubit {
  TickStreamCubitExtended(super.service, this.activeSymbolStateStream) {
    activeSymbolStateStream.listen(
      (SelectedActiveSymbolState activeSymbolState) {
        print('TickStreamCubitExtended: $activeSymbolState');

        switch (activeSymbolState) {
          case SelectedActiveSymbolUpdateState():
            _onSelectedActiveSymbolChanged(
              activeSymbol: activeSymbolState.activeSymbol,
            );
            break;
        }
      },
    );
  }

  final Stream<SelectedActiveSymbolState> activeSymbolStateStream;

  void _onSelectedActiveSymbolChanged({ActiveSymbolEntity? activeSymbol}) {
    if (activeSymbol != null) {
      fetchTickStream(activeSymbol);
    }
  }
}
