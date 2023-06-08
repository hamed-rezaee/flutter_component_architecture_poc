import 'package:example/features/market_ticks/domain/base_tick_stream_service.dart';
import 'package:example/features/market_ticks/presentation/tick_stream_entity.dart';

class TickStreamService extends BaseTickStreamService {
  TickStreamService(super.repository);

  @override
  Stream<TickStreamEntity> getTickStream(String symbol) =>
      repository.getTickStream(symbol);
}
