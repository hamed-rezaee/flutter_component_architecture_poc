import 'dart:async';

import 'package:example/core/contracts/domain/base_repository.dart';

import '../../tick_history/domain/tick_history_entity.dart';

abstract class BaseTickHistoryRepository implements BaseRepository {
  Future<TickHistoryEntity> fetchTickHistory(String symbol, int count);
}
