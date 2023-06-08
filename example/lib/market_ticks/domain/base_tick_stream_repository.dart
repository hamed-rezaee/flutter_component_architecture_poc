import 'dart:async';

import 'package:example/market_ticks/domain/tick_stream_mapper.dart';

import '../../core/contracts/domain/base_repository.dart';
import '../presentation/tick_stream_entity.dart';
import 'base_tick_stream_data_source.dart';

abstract class BaseTickStreamRepository implements BaseRepository {
  BaseTickStreamRepository(this.mapper, this.dataSource);

  @override
  final TickStreamMapper mapper;

  @override
  final BaseTickStreamDataSource dataSource;

  Stream<TickStreamEntity> getTickStream(String symbol);
}
