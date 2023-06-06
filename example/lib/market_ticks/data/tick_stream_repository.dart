import '../domain/base_repository.dart';
import '../presentation/tick_stream_entity.dart';
import 'tick_stream_data_source.dart';
import 'tick_stream_mapper.dart';
import 'tick_stream_model.dart';

class TickStreamRepoistory extends BaseRepository {
  TickStreamRepoistory(TickStreamMapper mapper, TickStreamDataSource dataSource)
      : super(mapper, dataSource);

  @override
  TickStreamMapper get mapper => TickStreamMapper();

  @override
  TickStreamDataSource get dataSource => TickStreamDataSource();

  Stream<TickStreamEntity> getTickStream(String symbol) =>
      dataSource.getTickStream(symbol).map(
            (Map<String, dynamic> event) =>
                mapper.toEntity(TickStreamModel.fromJson(event)),
          );
}
