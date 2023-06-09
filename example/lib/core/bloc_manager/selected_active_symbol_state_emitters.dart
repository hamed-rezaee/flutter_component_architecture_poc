import 'package:example/core/bloc_manager/selected_active_symbol_state_listener.dart';
import 'package:example/features/active_symbol/presentation/selected_active_symbol_cubit.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';

/// selected active symbol state emitter.
class SelectedActiveSymbolStateEmitter extends BaseStateEmitter<
    SelectedActiveSymbolStateListener, SelectedActiveSymbolCubit> {
  /// Initializes Active symbol state emitter.
  SelectedActiveSymbolStateEmitter(BaseBlocManager blocManager)
      : super(blocManager);

  @override
  void handleStates({
    required SelectedActiveSymbolStateListener stateListener,
    required Object state,
  }) {
    if (state is SelectedActiveSymbolUpdateState) {
      stateListener.onChanged(activeSymbol: state.activeSymbol);
    }
  }
}