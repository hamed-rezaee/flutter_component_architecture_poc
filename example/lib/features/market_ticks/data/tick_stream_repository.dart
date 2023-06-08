import 'dart:async';

import 'package:example/features/market_ticks/data/tick_stream_model.dart';
import 'package:example/features/market_ticks/domain/base_tick_stream_data_source.dart';
import 'package:example/features/market_ticks/domain/base_tick_stream_repository.dart';
import 'package:example/features/market_ticks/domain/tick_stream_mapper.dart';
import 'package:example/features/market_ticks/presentation/tick_stream_entity.dart';

class TickStreamRepoistory implements BaseTickStreamRepository {
  TickStreamRepoistory(this.mapper, this.dataSource);

  @override
  final TickStreamMapper mapper;

  @override
  final BaseTickStreamDataSource dataSource;

  @override
  Stream<TickStreamEntity> getTickStream(String symbol) =>
      dataSource.getTickStream(symbol).transform(
            StreamTransformer<TickStreamModel, TickStreamEntity>.fromHandlers(
              handleData:
                  (TickStreamModel model, EventSink<TickStreamEntity> sink) =>
                      sink.add(mapper.toEntity(model)),
            ),
          );
}
