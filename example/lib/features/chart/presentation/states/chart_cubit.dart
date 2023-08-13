import 'package:example/core/extensions/converters.dart';
import 'package:example/core/widgets/basic_chart/basic_chart.dart';
import 'package:example/features/chart/Interactor/chart_service.dart';
import 'package:example/features/tick_history/Interactor/base_tick_history_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chart_state.dart';

class ChartCubit extends Cubit<ChartState> {
  ChartCubit(this.service, this.tickHistoryService)
      : super(const ChartLoadingState());

  final ChartService service;
  final BaseTickHistoryService tickHistoryService;

  Future<void> updateChart(
    BasicChartModel model, {
    int maxlength = 50,
    bool reload = false,
  }) async {
    try {
      if (reload || state is ChartLoadingState) {
        emit(ChartLoadedState(await _initializeData(model.symbol, maxlength)));

        return;
      }

      if (state is ChartLoadedState) {
        emit(ChartLoadedState(_updateData(model, maxlength)));
      }
    } on Exception catch (e) {
      emit(ChartErrorState('$e'));
    }
  }

  Future<List<BasicChartModel>> _initializeData(
    String symbol,
    int maxlength,
  ) async =>
      (await tickHistoryService.fetchTickHistory(symbol, maxlength))
          .toBasicChartModel(symbol);

  List<BasicChartModel> _updateData(BasicChartModel model, int maxlength) =>
      service.adjustData(
        List<BasicChartModel>.from((state as ChartLoadedState).data),
        maxlength,
      )..add(model);
}
