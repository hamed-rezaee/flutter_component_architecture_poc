import '../domain/active_symbol_entity.dart';
import '../domain/base_active_symbol_repository.dart';
import 'base_active_symbol_service.dart';

class ActiveSymbolService implements BaseActiveSymbolService {
  ActiveSymbolService(this.repository);

  @override
  final BaseActiveSymbolRepository repository;

  @override
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols() =>
      repository.fetchActiveSymbols();
}
