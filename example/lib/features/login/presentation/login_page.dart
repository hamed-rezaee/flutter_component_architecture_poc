import 'package:example/features/login/presentation/states/login_cubit.dart';
import 'package:example/features/login/presentation/widgets/login_form.dart';
import 'package:example/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LoginCubit>().isLoggedIn();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: BlocConsumer<LoginCubit, LoginState>(listener: (
          BuildContext context,
          LoginState state,
        ) {
          if (state is LoginLoadingState) {
            context.push(loadingDialogPath);
          } else if (state is LoginLoggedInState) {
            context.go(homePagePath);
          }
        }, builder: (
          BuildContext context,
          LoginState state,
        ) {
          if (state is LoginLoggedOutState || state is LoginLoadingState) {
            return LoginForm(
              onLoginPressed: (String token) =>
                  context.read<LoginCubit>().authorize(token),
            );
          }

          if (state is LoginErrorState) {
            return Center(child: Text(state.message));
          }

          return const Center(child: Text('Unknown State'));
        }),
      ),
    );
  }
}
