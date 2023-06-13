import 'package:example/core/contracts/domain/base_mapper.dart';
import 'package:example/features/tick_stream/data/tick_stream_model.dart';
import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';

class TickStreamMapper
    implements BaseMapper<TickStreamEntity, TickStreamModel> {
  @override
  TickStreamModel toModel(TickStreamEntity entity) => TickStreamModel(
        ask: entity.ask,
        bid: entity.bid,
        epoch: entity.epoch,
        id: entity.id,
        pipSize: entity.pipSize,
        quote: entity.quote,
        symbol: entity.symbol,
      );

  @override
  TickStreamEntity toEntity(TickStreamModel model) => TickStreamEntity(
        ask: model.ask,
        bid: model.bid,
        epoch: model.epoch,
        id: model.id,
        pipSize: model.pipSize,
        quote: model.quote,
        symbol: model.symbol,
      );
}
