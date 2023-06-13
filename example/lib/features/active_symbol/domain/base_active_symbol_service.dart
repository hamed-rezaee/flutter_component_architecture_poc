import 'package:example/core/contracts/domain/base_service.dart';
import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';
import 'package:example/features/active_symbol/domain/base_active_symbol_repository.dart';

abstract class BaseActiveSymbolService implements BaseService {
  BaseActiveSymbolService(this.repository);

  @override
  final BaseActiveSymbolRepository repository;

  Future<List<ActiveSymbolEntity>> fetchActiveSymbols();
}
