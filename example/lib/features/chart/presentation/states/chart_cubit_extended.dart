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
    this.connectivityStream,
    this.symbolStream,
  ) {
    _handleConnectivty();
    _handleActiveSymbolStream();
  }

  final Stream<ConnectivityStatus> connectivityStream;
  final Stream<TickStreamState> symbolStream;

  void _onTickStreamLoaded({TickStreamEntity? symbol, bool reload = false}) {
    if (symbol == null) {
      return;
    }

    updateChart(
      BasicChartModel(
        symbol: symbol.symbol,
        epoch: symbol.epoch,
        quote: symbol.quote,
        pipSize: symbol.pipSize,
      ),
      reload: reload,
    );
  }

  void _handleConnectivty() => connectivityStream
          .where((ConnectivityStatus status) =>
              status == ConnectivityStatus.connected)
          .listen(
        (_) async {
          final TickStreamLoadedState tickState =
              await symbolStream.whereType<TickStreamLoadedState>().first;

          _onTickStreamLoaded(symbol: tickState.tick, reload: true);
        },
      );

  void _handleActiveSymbolStream() =>
      symbolStream.whereType<TickStreamLoadedState>().listen(
            (TickStreamLoadedState state) =>
                _onTickStreamLoaded(symbol: state.tick),
          );
}
