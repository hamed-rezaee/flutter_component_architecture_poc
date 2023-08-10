import 'package:example/core/contracts/Interactor/base_service_with_repository.dart';

import '../domain/tick_history_entity.dart';

abstract class BaseTickHistoryService implements BaseServiceWithRepository {
  Future<TickHistoryEntity> fetchTickHistory(String symbol, int count);
}
