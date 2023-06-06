import '../domain/base_repository.dart';
import '../presentation/tick_stream_entity.dart';
import 'tick_stream_data_source.dart';
import 'tick_stream_mapper.dart';
import 'tick_stream_model.dart';

class TickStreamRepoistory extends BaseRepository {
  TickStreamRepoistory(super.mapper, super.dataSource);

  Stream<TickStreamEntity> getTickStream(String symbol) =>
      (dataSource as TickStreamDataSource).getTickStream(symbol).map(
            (Map<String, dynamic> event) => (mapper as TickStreamMapper)
                .toEntity(TickStreamModel.fromJson(event)),
          );
}
