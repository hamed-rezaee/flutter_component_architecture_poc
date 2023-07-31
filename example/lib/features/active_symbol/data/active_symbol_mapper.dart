import 'package:example/core/contracts/data/base_mapper.dart';

import '../domain/active_symbol_entity.dart';
import 'active_symbol_model.dart';

class ActiveSymbolMapper
    implements BaseMapper<ActiveSymbolEntity, ActiveSymbolModel> {
  @override
  ActiveSymbolEntity toEntity(ActiveSymbolModel model) => ActiveSymbolEntity(
        symbol: model.symbol,
        symbolDisplayName: model.symbolDisplayName,
        market: model.market,
        marketDisplayName: model.marketDisplayName,
      );
}
