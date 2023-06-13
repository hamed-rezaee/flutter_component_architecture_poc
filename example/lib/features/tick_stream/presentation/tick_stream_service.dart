import 'package:example/features/tick_stream/domain/base_tick_stream_repository.dart';
import 'package:example/features/tick_stream/domain/base_tick_stream_service.dart';
import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';

class TickStreamService implements BaseTickStreamService {
  TickStreamService(this.repository);

  @override
  final BaseTickStreamRepository repository;

  @override
  Stream<TickStreamEntity> fetchTickStream(String symbol) =>
      repository.fetchTickStream(symbol);

  @override
  void forgetTickStream() => repository.forgetTickStream();
}
