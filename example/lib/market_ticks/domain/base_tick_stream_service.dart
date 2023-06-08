import 'package:example/market_ticks/domain/base_tick_stream_repository.dart';

import '../../core/contracts/domain/base_service.dart';
import '../presentation/tick_stream_entity.dart';

abstract class BaseTickStreamService implements BaseService {
  BaseTickStreamService(this.repository);

  @override
  final BaseTickStreamRepository repository;

  Stream<TickStreamEntity> getTickStream(String symbol) =>
      repository.getTickStream(symbol);
}
