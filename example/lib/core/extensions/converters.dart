import 'package:example/core/widgets/basic_chart/basic_chart.dart';
import 'package:example/features/tick_history/domain/tick_history_entity.dart';

extension TickHistory on TickHistoryEntity {
  List<BasicChartModel> toBasicChartModel(String symbol) {
    final List<BasicChartModel> models = <BasicChartModel>[];

    for (final int time in times) {
      models.add(
        BasicChartModel(
          symbol: symbol,
          epoch: time,
          quote: prices[times.indexOf(time)].toDouble(),
          pipSize: pipSize,
        ),
      );
    }

    return models;
  }
}
