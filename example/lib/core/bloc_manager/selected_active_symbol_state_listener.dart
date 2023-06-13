import 'package:flutter_deriv_bloc_manager/manager.dart';

import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';

/// An abstract class that has to be implemented by the state listeners.
abstract class SelectedActiveSymbolStateListener implements BaseStateListener {
  /// On active symbol changed callback.
  void onChanged({ActiveSymbolEntity? activeSymbol});
}
