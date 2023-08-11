import 'package:example/features/login/Interactor/base_login_service.dart';
import 'package:example/features/login/domain/login_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.service) : super(const LoginLoggedOutState());

  final BaseLoginService service;

  Future<bool> isLoggedIn() async => true;

  Future<void> authorize(String token) async {
    try {
      emit(const LoginLoadingState());

      final LoginEntity login = await service.authorize(token);

      emit(LoginLoggedInState(login));
    } on Exception catch (e) {
      emit(LoginErrorState('$e'));
    }
  }

  Future<void> logout() async {
    try {
      await service.logout();

      emit(const LoginLoggedOutState());
    } on Exception catch (e) {
      emit(LoginErrorState('$e'));
    }
  }
}
