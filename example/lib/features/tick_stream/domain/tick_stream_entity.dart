import 'package:example/core/contracts/domain/base_entity.dart';

class TickStreamEntity extends BaseEntity {
  TickStreamEntity({
    required this.epoch,
    required this.quote,
    required this.symbol,
  });

  final int epoch;
  final double quote;
  final String symbol;
}
