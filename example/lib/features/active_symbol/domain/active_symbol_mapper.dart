import 'package:example/core/contracts/domain/base_mapper.dart';
import 'package:example/features/active_symbol/data/active_symbol_model.dart';
import 'package:example/features/active_symbol/presentation/active_symbol_entity.dart';

class ActiveSymbolMapper
    implements BaseMapper<ActiveSymbolEntity, ActiveSymbolModel> {
  @override
  ActiveSymbolModel toModel(ActiveSymbolEntity entity) => ActiveSymbolModel(
        symbol: entity.symbol,
        symbolDisplayName: entity.symbolDisplayName,
        market: entity.market,
        marketDisplayName: entity.marketDisplayName,
      );

  @override
  ActiveSymbolEntity toEntity(ActiveSymbolModel model) => ActiveSymbolEntity(
        symbol: model.symbol,
        symbolDisplayName: model.symbolDisplayName,
        market: model.market,
        marketDisplayName: model.marketDisplayName,
      );
}
