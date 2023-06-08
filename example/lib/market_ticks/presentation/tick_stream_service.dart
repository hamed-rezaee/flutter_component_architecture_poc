import 'package:example/market_ticks/domain/base_tick_stream_service.dart';

import 'tick_stream_entity.dart';

class TickStreamService extends BaseTickStreamService {
  TickStreamService(super.repository);

  @override
  Stream<TickStreamEntity> getTickStream(String symbol) =>
      repository.getTickStream(symbol);
}
