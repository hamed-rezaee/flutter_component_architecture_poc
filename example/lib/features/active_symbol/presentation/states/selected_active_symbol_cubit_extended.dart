import 'package:example/features/active_symbol/presentation/states/selected_active_symbol_cubit.dart';
import 'package:example/features/login/presentation/states/login_cubit.dart';

class SelectedActiveSymbolCubitExtended extends SelectedActiveSymbolCubit {
  SelectedActiveSymbolCubitExtended(this.loginStateStream) {
    _handleLogout();
  }

  final Stream<LoginState> loginStateStream;

  void _handleLogout() {
    loginStateStream.listen((LoginState event) {
      if (event is LoginLoggedOutState) {
        updateActiveSymbol();
      }
    });
  }
}
