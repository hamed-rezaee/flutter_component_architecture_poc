import 'package:example/core/enums.dart';
import 'package:example/core/widgets/basic_chart/basic_chart.dart';
import 'package:example/features/chart/presentation/states/chart_cubit.dart';
import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';
import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit.dart';
import 'package:rxdart/rxdart.dart';

class ChartCubitExtended extends ChartCubit {
  ChartCubitExtended(
    super.service,
    super.tickHistoryService,
    this.connectivityStatusStream,
    this.activeSymbolStateStream,
  ) {
    _handleConnectivty();
    _handleActiveSymbolStream();
  }

  final Stream<ConnectivityStatus> connectivityStatusStream;
  final Stream<TickStreamState> activeSymbolStateStream;

  void _onTickStreamLoaded({
    TickStreamEntity? activeSymbol,
    bool reload = false,
  }) {
    if (activeSymbol != null) {
      updateChart(
        BasicChartModel(
          symbol: activeSymbol.symbol,
          epoch: activeSymbol.epoch,
          quote: activeSymbol.quote,
          pipSize: activeSymbol.pipSize,
        ),
        reload: reload,
      );
    }
  }

  void _handleConnectivty() {
    connectivityStatusStream.listen(
      (ConnectivityStatus connectivityStatus) async {
        if (connectivityStatus == ConnectivityStatus.connected) {
          final TickStreamLoadedState tickStreamState =
              await activeSymbolStateStream
                  .whereType<TickStreamLoadedState>()
                  .first;

          _onTickStreamLoaded(activeSymbol: tickStreamState.tick, reload: true);
        }
      },
    );
  }

  void _handleActiveSymbolStream() {
    activeSymbolStateStream.listen(
      (TickStreamState activeSymbolState) {
        if (activeSymbolState is TickStreamLoadedState) {
          _onTickStreamLoaded(activeSymbol: activeSymbolState.tick);
        }
      },
    );
  }
}
