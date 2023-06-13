import 'package:example/features/active_symbol/domain/base_active_symbol_repository.dart';
import 'package:example/features/active_symbol/domain/base_active_symbol_service.dart';
import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';

class ActiveSymbolService implements BaseActiveSymbolService {
  ActiveSymbolService(this.repository);

  @override
  final BaseActiveSymbolRepository repository;

  @override
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols() =>
      repository.fetchActiveSymbols();
}
