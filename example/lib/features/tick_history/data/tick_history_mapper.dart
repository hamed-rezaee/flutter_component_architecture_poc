import 'package:example/core/contracts/data/base_mapper.dart';

import '../domain/tick_history_entity.dart';
import 'tick_history_model.dart';

class TickHistoryMapper
    implements BaseMapper<TickHistoryEntity, TickHistoryModel> {
  @override
  TickHistoryEntity toEntity(TickHistoryModel model) => TickHistoryEntity(
        prices: model.prices,
        times: model.times,
        pipSize: model.pipSize,
      );
}
