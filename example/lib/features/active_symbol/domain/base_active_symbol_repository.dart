import 'dart:async';

import 'package:example/core/contracts/domain/base_repository.dart';
import 'package:example/features/active_symbol/domain/active_symbol_mapper.dart';
import 'package:example/features/active_symbol/domain/base_active_symbol_data_source.dart';
import 'package:example/features/active_symbol/presentation/active_symbol_entity.dart';

abstract class BaseActiveSymbolRepository implements BaseRepository {
  BaseActiveSymbolRepository(this.mapper, this.dataSource);

  @override
  final ActiveSymbolMapper mapper;

  @override
  final BaseActiveSymbolDataSource dataSource;

  Future<List<ActiveSymbolEntity>> fetchActiveSymbols();
}
