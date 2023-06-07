import '../../core/generic_domain/base_service.dart';
import '../data/tick_stream_repository.dart';
import 'tick_stream_entity.dart';

class TickStreamService extends BaseService {
  TickStreamService(super.repository);

  Stream<TickStreamEntity> getTickStream(String symbol) =>
      (repository as TickStreamRepoistory).getTickStream(symbol);
}
