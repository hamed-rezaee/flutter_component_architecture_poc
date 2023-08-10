part of 'login_cubit.dart';

abstract class LoginState {
  const LoginState();
}

class LoginLoggedInState extends LoginState {
  const LoginLoggedInState(this.loginInformation);

  final LoginEntity loginInformation;
}

class LoginLoggedOutState extends LoginState {
  const LoginLoggedOutState();
}

class LoginErrorState extends LoginState {
  LoginErrorState(this.message);

  final String message;
}
