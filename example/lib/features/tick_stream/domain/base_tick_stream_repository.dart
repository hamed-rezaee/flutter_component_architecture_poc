import 'dart:async';

import 'package:example/core/contracts/data/base_model.dart';
import 'package:example/core/contracts/data/base_data_source.dart';
import 'package:example/core/contracts/domain/base_mapper.dart';
import 'package:example/core/contracts/domain/base_repository.dart';
import 'package:example/core/contracts/domain/base_entity.dart';
import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';

abstract class BaseTickStreamRepository implements BaseRepository {
  BaseTickStreamRepository(this.mapper, this.dataSource);

  @override
  final BaseMapper<BaseEntity, BaseModel> mapper;

  @override
  final BaseDataSource dataSource;

  void forgetTickStream();

  Stream<TickStreamEntity> fetchTickStream(String symbol);
}
