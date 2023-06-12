import 'dart:async';

import 'package:example/features/active_symbol/data/active_symbol_mapper.dart';
import 'package:example/features/active_symbol/domain/base_active_symbol_data_source.dart';
import 'package:example/features/active_symbol/domain/base_active_symbol_repository.dart';
import 'package:example/features/active_symbol/presentation/active_symbol_entity.dart';

class ActiveSymbolRepoistory implements BaseActiveSymbolRepository {
  ActiveSymbolRepoistory(this.mapper, this.dataSource);

  @override
  final ActiveSymbolMapper mapper;

  @override
  final BaseActiveSymbolDataSource dataSource;

  @override
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols() async =>
      (await dataSource.fetchActiveSymbols()).map(mapper.toEntity).toList();
}
