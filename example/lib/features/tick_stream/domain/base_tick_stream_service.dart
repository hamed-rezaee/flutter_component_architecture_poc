import 'package:example/core/contracts/domain/base_service.dart';
import 'package:example/features/tick_stream/domain/base_tick_stream_repository.dart';
import 'package:example/features/tick_stream/presentation/tick_stream_entity.dart';

abstract class BaseTickStreamService implements BaseService {
  BaseTickStreamService(this.repository);

  @override
  final BaseTickStreamRepository repository;

  void forgetTickStream(String id) => repository.forgetTickStream(id);

  Stream<TickStreamEntity> getTickStream(String symbol) =>
      repository.getTickStream(symbol);
}
