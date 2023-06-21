import 'package:example/core/contracts/Interactor/base_service.dart';
import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';

abstract class BaseTickStreamService implements BaseService {
  void forgetTickStream(String id);

  Stream<TickStreamEntity> fetchTickStream(String symbol);
}
