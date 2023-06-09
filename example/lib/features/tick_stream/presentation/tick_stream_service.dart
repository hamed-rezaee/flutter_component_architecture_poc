import 'package:example/features/tick_stream/domain/base_tick_stream_service.dart';
import 'package:example/features/tick_stream/presentation/tick_stream_entity.dart';

class TickStreamService extends BaseTickStreamService {
  TickStreamService(super.repository);

  @override
  Stream<TickStreamEntity> fetchTickStream(String symbol) =>
      repository.fetchTickStream(symbol);
}
