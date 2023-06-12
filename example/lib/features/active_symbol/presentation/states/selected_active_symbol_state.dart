part of 'selected_active_symbol_cubit.dart';

abstract class SelectedActiveSymbolState {
  /// Initializes a new instance of [SelectedActiveSymbolState].
  const SelectedActiveSymbolState({this.activeSymbol});

  final ActiveSymbolEntity? activeSymbol;
}

class SelectedActiveSymbolUpdateState extends SelectedActiveSymbolState {
  /// Initializes a new instance of [SelectedActiveSymbolUpdateState].
  SelectedActiveSymbolUpdateState({ActiveSymbolEntity? activeSymbol})
      : super(activeSymbol: activeSymbol);
}
