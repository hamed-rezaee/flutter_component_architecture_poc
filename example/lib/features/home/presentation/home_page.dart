import 'package:example/core/widgets/dialogs.dart';
import 'package:example/features/active_symbol/presentation/widgets/active_symbol.dart';
import 'package:example/features/login/domain/login_entity.dart';
import 'package:example/features/login/presentation/states/login_cubit.dart';
import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit.dart';
import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit_extended.dart';
import 'package:example/features/tick_stream/presentation/widgets/tick_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Active Symbols'),
          leading: _userButton(context),
          actions: <Widget>[_chartButton()],
        ),
        body: const Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              SizedBox(height: 48, child: ActiveSymbol()),
              Expanded(child: TickStream()),
            ],
          ),
        ),
      );

  Widget _chartButton() =>
      BlocBuilder<TickStreamCubitExtended, TickStreamState>(
        builder: (BuildContext context, TickStreamState state) => IconButton(
          icon: const Icon(Icons.ssid_chart_rounded),
          onPressed: state is TickStreamLoadedState
              ? () => context.push('/chart_page')
              : null,
        ),
      );

  Widget _userButton(BuildContext context) => IconButton(
        icon: const Icon(Icons.person),
        onPressed: () {
          final LoginCubit loginCubit = context.read<LoginCubit>();
          final LoginState state = loginCubit.state;

          if (state is LoginLoggedInState) {
            final LoginEntity user = state.loginInformation;

            logoutDialog(context, user.loginId, () {
              loginCubit.logout();

              context.go('/login_page');
            });
          }
        },
      );
}
