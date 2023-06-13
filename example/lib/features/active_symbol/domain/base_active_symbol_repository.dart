import 'dart:async';

import 'package:example/core/contracts/data/base_model.dart';
import 'package:example/core/contracts/data/base_data_source.dart';
import 'package:example/core/contracts/domain/base_mapper.dart';
import 'package:example/core/contracts/domain/base_repository.dart';
import 'package:example/core/contracts/domain/base_entity.dart';
import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';

abstract class BaseActiveSymbolRepository implements BaseRepository {
  BaseActiveSymbolRepository(this.mapper, this.dataSource);

  @override
  final BaseMapper<BaseEntity, BaseModel> mapper;

  @override
  final BaseDataSource dataSource;

  Future<List<ActiveSymbolEntity>> fetchActiveSymbols();
}
