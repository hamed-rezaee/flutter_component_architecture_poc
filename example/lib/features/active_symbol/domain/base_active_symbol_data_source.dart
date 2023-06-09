import 'dart:async';

import 'package:example/core/contracts/domain/base_data_source.dart';
import 'package:example/features/active_symbol/data/active_symbol_model.dart';

abstract class BaseActiveSymbolDataSource implements BaseDataSource {
  Future<List<ActiveSymbolModel>> fetchActiveSymbols();
}
