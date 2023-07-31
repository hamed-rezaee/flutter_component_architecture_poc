import 'package:example/core/contracts/Interactor/base_service.dart';

import '../domain/active_symbol_entity.dart';

abstract class BaseActiveSymbolService implements BaseService {
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols();
}
