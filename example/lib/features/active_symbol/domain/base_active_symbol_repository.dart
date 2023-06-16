import 'dart:async';

import 'package:example/core/contracts/domain/base_repository.dart';
import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';

abstract class BaseActiveSymbolRepository implements BaseRepository {
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols();
}
