import 'package:example/core/widgets/basic_chart/basic_chart_model.dart';
import 'package:example/features/chart/Interactor/chart_service.dart';
import 'package:example/features/tick_history/Interactor/base_tick_history_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example/core/extensions/converters.dart';

import '../../../tick_history/domain/tick_history_entity.dart';

part 'chart_state.dart';

class ChartCubit extends Cubit<ChartState> {
  ChartCubit(this.service, this.tickHistoryService)
      : super(const ChartLoadingState());

  final ChartService service;
  final BaseTickHistoryService tickHistoryService;

  Future<void> updateChart(
    BasicChartModel model, [
    int maxVisibleTicks = 50,
  ]) async {
    try {
      if (state is ChartLoadingState) {
        final TickHistoryEntity tickHistory = await tickHistoryService
            .fetchTickHistory(model.symbol, maxVisibleTicks);

        emit(ChartLoadedState(tickHistory.toBasicChartModel(model.symbol)));

        return;
      }

      if (state is ChartLoadedState) {
        final List<BasicChartModel> data = service.trunkChartData(
          List<BasicChartModel>.from((state as ChartLoadedState).data),
          maxVisibleTicks,
        )..add(model);

        emit(ChartLoadedState(data));
      }
    } on Exception catch (e) {
      emit(ChartErrorState('$e'));
    }
  }
}
