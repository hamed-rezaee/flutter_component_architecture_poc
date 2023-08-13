import 'package:example/core/connectivity_service/connectivity_service.dart';
import 'package:example/core/persistent_data_service/shared_preferences_sarvice.dart';
import 'package:example/features/active_symbol/Interactor/active_symbol_service.dart';
import 'package:example/features/active_symbol/data/active_symbol_data_source.dart';
import 'package:example/features/active_symbol/data/active_symbol_mapper.dart';
import 'package:example/features/active_symbol/data/active_symbol_repository.dart';
import 'package:example/features/active_symbol/presentation/states/active_symbol_cubit.dart';
import 'package:example/features/active_symbol/presentation/states/selected_active_symbol_cubit_extended.dart';
import 'package:example/features/login/Interactor/login_service.dart';
import 'package:example/features/login/data/login_data_source.dart';
import 'package:example/features/login/data/login_mapper.dart';
import 'package:example/features/login/data/login_repository.dart';
import 'package:example/features/login/presentation/states/login_cubit.dart';
import 'package:example/features/tick_stream/Interactor/tick_stream_service.dart';
import 'package:example/features/tick_stream/data/tick_stream_data_source.dart';
import 'package:example/features/tick_stream/data/tick_stream_mapper.dart';
import 'package:example/features/tick_stream/data/tick_stream_repository.dart';
import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit_extended.dart';
import 'package:example/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginCubit loginCubit = LoginCubit(
      LoginService(
        LoginRepoistory(LoginDataSource(LoginMapper())),
      ),
      SharedPreferencesService(),
    );

    final SelectedActiveSymbolCubitExtended selectedActiveSymbolCubit =
        SelectedActiveSymbolCubitExtended(loginCubit.stream);

    final ActiveSymbolCubit activeSymbolCubit = ActiveSymbolCubit(
      ActiveSymbolService(
        ActiveSymbolRepoistory(ActiveSymbolDataSource(ActiveSymbolMapper())),
      ),
    );

    final TickStreamCubitExtended tickStreamCubitExtended =
        TickStreamCubitExtended(
      TickStreamService(
        TickStreamRepoistory(TickStreamDataSource(TickStreamMapper())),
      ),
      ConnectivityService().connectivityStatus,
      selectedActiveSymbolCubit.stream,
    );

    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<LoginCubit>(create: (BuildContext context) => loginCubit),
        BlocProvider<SelectedActiveSymbolCubitExtended>(
          create: (BuildContext context) => selectedActiveSymbolCubit,
        ),
        BlocProvider<ActiveSymbolCubit>(
          create: (BuildContext context) => activeSymbolCubit,
        ),
        BlocProvider<TickStreamCubitExtended>(
          create: (BuildContext context) => tickStreamCubitExtended,
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.orange,
        ),
      ),
    );
  }
}
