import 'package:example/core/contracts/presentation/base_entity.dart';

class ActiveSymbolEntity extends BaseEntity {
  ActiveSymbolEntity({
    required this.symbol,
    required this.symbolDisplayName,
    required this.market,
    required this.marketDisplayName,
  });

  final String symbol;
  final String symbolDisplayName;
  final String market;
  final String marketDisplayName;
}
