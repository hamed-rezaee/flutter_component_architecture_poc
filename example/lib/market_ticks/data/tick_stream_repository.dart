import 'dart:async';
import 'dart:isolate';

import '../domain/base_repository.dart';
import '../presentation/tick_stream_entity.dart';
import 'tick_stream_data_source.dart';
import 'tick_stream_mapper.dart';
import 'tick_stream_model.dart';

class TickStreamRepoistory extends BaseRepository {
  TickStreamRepoistory(super.mapper, super.dataSource);

  Stream<TickStreamEntity> getTickStream(String symbol) =>
      (dataSource as TickStreamDataSource).getTickStream(symbol).transform(
        StreamTransformer<Map<String, dynamic>, TickStreamEntity>.fromHandlers(
          handleData: (
            Map<String, dynamic> event,
            EventSink<TickStreamEntity> sink,
          ) async {
            final TickStreamModel model = await Isolate.run(
              () => TickStreamModel.fromJson(event),
            );

            sink.add((mapper as TickStreamMapper).toEntity(model));
          },
        ),
      );
}
