import '../domain/base_tick_history_repository.dart';
import '../domain/tick_history_entity.dart';
import 'base_tick_history_service.dart';

class TickHistoryService implements BaseTickHistoryService {
  TickHistoryService(this.repository);

  @override
  final BaseTickHistoryRepository repository;

  @override
  Future<TickHistoryEntity> fetchTickHistory(String symbol, int count) =>
      repository.fetchTickHistory(symbol, count);
}
