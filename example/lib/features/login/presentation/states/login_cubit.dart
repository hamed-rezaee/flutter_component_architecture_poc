import 'package:example/core/persistent_data_service/base_persistent_data_service.dart';
import 'package:example/features/login/Interactor/base_login_service.dart';
import 'package:example/features/login/domain/login_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.service, this.persistentDataService)
      : super(const LoginLoggedOutState());

  final BaseLoginService service;
  final BasePersistentDataService persistentDataService;

  Future<String> get loginId async =>
      await persistentDataService.read<String?>('login_id') ?? '';

  Future<void> isLoggedIn() async {
    emit(const LoginLoadingState());

    final String? loginId =
        await persistentDataService.read<String?>('login_id');

    emit(loginId == null
        ? const LoginLoggedOutState()
        : LoginLoggedInState(loginId));
  }

  Future<void> authorize(String token) async {
    try {
      emit(const LoginLoadingState());

      await Future<void>.delayed(const Duration(seconds: 2));

      String? loginId = await persistentDataService.read<String?>('login_id');

      if (loginId == null) {
        final LoginEntity login = await service.authorize(token);

        loginId = login.loginId;
        await persistentDataService.write('login_id', login.loginId);
      }

      emit(LoginLoggedInState(loginId));
    } catch (e) {
      emit(LoginErrorState('$e'));
    }
  }

  Future<void> logout() async {
    try {
      await service.logout();
      await persistentDataService.delete('login_id');

      emit(const LoginLoggedOutState());
    } catch (e) {
      emit(LoginErrorState('$e'));
    }
  }
}
