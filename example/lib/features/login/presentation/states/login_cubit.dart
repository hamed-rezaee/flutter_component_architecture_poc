import 'package:example/features/login/Interactor/base_login_service.dart';
import 'package:example/features/login/domain/login_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class TickSteamCubit extends Cubit<LoginState> {
  TickSteamCubit(this.service) : super(const LoginLoggedOutState());

  final BaseLoginService service;

  Future<bool> isLoggedIn() async => true;

  Future<void> authorize(String token) async {
    try {
      final LoginEntity loginInformation = await service.authorize(token);

      emit(LoginLoggedInState(loginInformation));
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
