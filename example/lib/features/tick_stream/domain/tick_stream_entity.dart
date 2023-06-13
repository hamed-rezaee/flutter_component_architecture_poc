import 'package:example/core/contracts/domain/base_entity.dart';

class TickStreamEntity extends BaseEntity {
  TickStreamEntity({
    required this.ask,
    required this.bid,
    required this.epoch,
    required this.id,
    required this.pipSize,
    required this.quote,
    required this.symbol,
  });

  final double ask;
  final double bid;
  final int epoch;
  final String id;
  final int pipSize;
  final double quote;
  final String symbol;
}
