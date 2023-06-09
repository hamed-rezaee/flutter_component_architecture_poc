import 'dart:async';

import 'package:example/core/contracts/domain/base_repository.dart';
import 'package:example/features/tick_stream/domain/base_tick_stream_data_source.dart';
import 'package:example/features/tick_stream/domain/tick_stream_mapper.dart';
import 'package:example/features/tick_stream/presentation/tick_stream_entity.dart';

abstract class BaseTickStreamRepository implements BaseRepository {
  BaseTickStreamRepository(this.mapper, this.dataSource);

  @override
  final TickStreamMapper mapper;

  @override
  final BaseTickStreamDataSource dataSource;

  void forgetTickStream();

  Stream<TickStreamEntity> fetchTickStream(String symbol);
}
