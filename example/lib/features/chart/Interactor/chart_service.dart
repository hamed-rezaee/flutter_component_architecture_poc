import 'package:example/core/widgets/basic_chart/basic_chart_model.dart';
import 'package:example/features/chart/Interactor/base_chart_service.dart';

class ChartService implements BaseChartService {
  const ChartService();

  List<BasicChartModel> trunkChartData(
    List<BasicChartModel> data, [
    int maxVisibleTicks = 50,
  ]) {
    if (data.length >= maxVisibleTicks) {
      data.removeAt(0);
    }

    return data;
  }
}
