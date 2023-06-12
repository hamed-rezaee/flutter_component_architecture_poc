import 'dart:async';

import 'package:example/features/tick_stream/data/tick_stream_model.dart';
import 'package:example/features/tick_stream/domain/base_tick_stream_data_source.dart';
import 'package:example/features/tick_stream/domain/base_tick_stream_repository.dart';
import 'package:example/features/tick_stream/data/tick_stream_mapper.dart';
import 'package:example/features/tick_stream/presentation/tick_stream_entity.dart';

class TickStreamRepoistory implements BaseTickStreamRepository {
  TickStreamRepoistory(this.mapper, this.dataSource);

  @override
  final TickStreamMapper mapper;

  @override
  final BaseTickStreamDataSource dataSource;

  @override
  void forgetTickStream() => dataSource.forgetTickStream();

  @override
  Stream<TickStreamEntity> fetchTickStream(String symbol) =>
      dataSource.fetchTickStream(symbol).transform(
            StreamTransformer<TickStreamModel, TickStreamEntity>.fromHandlers(
              handleData:
                  (TickStreamModel model, EventSink<TickStreamEntity> sink) =>
                      sink.add(mapper.toEntity(model)),
            ),
          );
}
