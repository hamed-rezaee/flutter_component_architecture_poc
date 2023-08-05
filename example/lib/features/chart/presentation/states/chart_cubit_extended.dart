import 'package:example/core/widgets/basic_chart/basic_chart_model.dart';
import 'package:example/features/chart/presentation/states/chart_cubit.dart';
import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';
import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit.dart';

class ChartCubitExtended extends ChartCubit {
  ChartCubitExtended(super.service, this.tickStreamStateStream) {
    tickStreamStateStream.listen(
      (TickStreamState activeSymbolState) {
        print('TickStreamCubitExtended: $activeSymbolState');

        switch (activeSymbolState) {
          case TickStreamLoadedState():
            _onTicksUpdate(ticks: activeSymbolState.ticks);
            break;
        }
      },
    );
  }

  final Stream<TickStreamState> tickStreamStateStream;

  void _onTicksUpdate({List<TickStreamEntity>? ticks}) {
    if (ticks != null) {
      emit(
        ChartLoadedState(
          ticks
              .map(
                (TickStreamEntity tick) => BasicChartModel(
                  epoch: tick.epoch,
                  quote: tick.quote,
                  pipSize: tick.pipSize,
                ),
              )
              .toList(),
        ),
      );
    }
  }
}
