import 'dart:async';

import '../domain/base_tick_history_repository.dart';
import '../domain/tick_history_entity.dart';
import 'base_tick_history_data_source.dart';
import 'tick_history_model.dart';

class TickHistoryRepoistory implements BaseTickHistoryRepository {
  TickHistoryRepoistory(this.dataSource);

  @override
  final BaseTickSHistoryDataSource dataSource;

  @override
  Future<TickHistoryEntity> fetchTickHistory(String symbol, int count) =>
      dataSource
          .fetchTickHistory(symbol, count)
          .then((TickHistoryModel model) => dataSource.mapper.toEntity(model));
}
