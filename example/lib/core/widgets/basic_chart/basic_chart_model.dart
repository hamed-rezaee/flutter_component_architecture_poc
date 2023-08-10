class BasicChartModel {
  BasicChartModel({
    required this.symbol,
    required this.epoch,
    required this.quote,
    required this.pipSize,
  });

  final String symbol;
  final int epoch;
  final double quote;
  final int pipSize;
}
