import 'dart:async';

import 'package:example/core/contracts/data/base_data_source.dart';

import 'active_symbol_mapper.dart';
import 'active_symbol_model.dart';

abstract class BaseActiveSymbolDataSource implements BaseDataSource {
  BaseActiveSymbolDataSource(this.mapper);

  @override
  final ActiveSymbolMapper mapper;

  Future<List<ActiveSymbolModel>> fetchActiveSymbols();
}
