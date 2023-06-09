import 'dart:async';

import 'package:example/core/contracts/domain/base_data_source.dart';
import 'package:example/features/tick_stream/data/tick_stream_model.dart';

abstract class BaseTickStreamDataSource implements BaseDataSource {
  void forgetTickStream();

  Stream<TickStreamModel> fetchTickStream(String symbol);
}
