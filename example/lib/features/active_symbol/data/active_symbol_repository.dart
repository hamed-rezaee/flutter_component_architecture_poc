import 'dart:async';

import '../domain/active_symbol_entity.dart';
import '../domain/base_active_symbol_repository.dart';
import 'base_active_symbol_data_source.dart';

class ActiveSymbolRepoistory implements BaseActiveSymbolRepository {
  ActiveSymbolRepoistory(this.dataSource);

  @override
  final BaseActiveSymbolDataSource dataSource;

  @override
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols() async =>
      (await dataSource.fetchActiveSymbols())
          .map(dataSource.mapper.toEntity)
          .toList();
}
