import 'package:example/core/enums.dart';
import 'package:example/core/widgets/basic_chart/basic_chart.dart';
import 'package:example/features/chart/presentation/states/chart_cubit.dart';
import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';
import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit.dart';

class ChartCubitExtended extends ChartCubit {
  ChartCubitExtended(
    super.service,
    super.tickHistoryService,
    this.connectivityStatusStream,
    this.activeSymbolStateStream,
  ) {
    _handleConnectivtyState();
    _handleActiveSymbolStream();
  }

  final Stream<ConnectivityStatus> connectivityStatusStream;

  final Stream<TickStreamState> activeSymbolStateStream;

  void _onTickStreamLoaded({TickStreamEntity? activeSymbol}) {
    if (activeSymbol != null) {
      updateChart(
        BasicChartModel(
          symbol: activeSymbol.symbol,
          epoch: activeSymbol.epoch,
          quote: activeSymbol.quote,
          pipSize: activeSymbol.pipSize,
        ),
      );
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

  void _handleActiveSymbolStream() {
    activeSymbolStateStream.listen(
      (TickStreamState activeSymbolState) {
        switch (activeSymbolState) {
          case TickStreamLoadedState():
            _onTickStreamLoaded(activeSymbol: activeSymbolState.tick);
        }
      },
    );
  }
}
