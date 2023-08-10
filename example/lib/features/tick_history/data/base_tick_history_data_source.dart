import 'dart:async';

import 'package:example/core/contracts/data/base_data_source.dart';

import 'tick_history_model.dart';
import 'tick_history_mapper.dart';

abstract class BaseTickSHistoryDataSource implements BaseDataSource {
  BaseTickSHistoryDataSource(this.mapper);

  @override
  final TickHistoryMapper mapper;

  Future<TickHistoryModel> fetchTickHistory(String symbol, int count);
}
