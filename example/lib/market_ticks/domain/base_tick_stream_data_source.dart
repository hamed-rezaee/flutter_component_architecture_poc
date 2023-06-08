import 'dart:async';

import 'package:example/market_ticks/data/tick_stream_model.dart';

import '../../core/contracts/domain/base_data_source.dart';

abstract class BaseTickStreamDataSource implements BaseDataSource {
  Stream<TickStreamModel> getTickStream(String symbol);
}
