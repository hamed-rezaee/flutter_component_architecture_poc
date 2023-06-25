import 'package:flutter_deriv_bloc_manager/manager.dart';

import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';

abstract class SelectedActiveSymbolStateListener implements BaseStateListener {
  void onChanged({ActiveSymbolEntity? activeSymbol});
}
