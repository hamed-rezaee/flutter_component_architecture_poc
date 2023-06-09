import 'package:example/features/active_symbol/domain/base_active_symbol_service.dart';
import 'package:example/features/active_symbol/presentation/active_symbol_entity.dart';

class ActiveSymbolService extends BaseActiveSymbolService {
  ActiveSymbolService(super.repository);

  @override
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols() =>
      repository.fetchActiveSymbols();
}
