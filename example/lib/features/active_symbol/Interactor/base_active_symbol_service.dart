import 'package:example/core/contracts/Interactor/base_service_with_repository.dart';

import '../domain/active_symbol_entity.dart';

abstract class BaseActiveSymbolService implements BaseServiceWithRepository {
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols();
}
