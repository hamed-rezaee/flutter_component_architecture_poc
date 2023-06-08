import 'dart:async';

import 'package:example/core/contracts/domain/base_repository.dart';
import 'package:example/features/market_ticks/domain/base_tick_stream_data_source.dart';
import 'package:example/features/market_ticks/domain/tick_stream_mapper.dart';
import 'package:example/features/market_ticks/presentation/tick_stream_entity.dart';

abstract class BaseTickStreamRepository implements BaseRepository {
  BaseTickStreamRepository(this.mapper, this.dataSource);

  @override
  final TickStreamMapper mapper;

  @override
  final BaseTickStreamDataSource dataSource;

  Stream<TickStreamEntity> getTickStream(String symbol);
}
