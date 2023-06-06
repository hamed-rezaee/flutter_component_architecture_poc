import 'package:example/market_ticks/data/tick_stream_mapper.dart';
import 'package:example/market_ticks/data/tick_stream_repository.dart';
import 'package:example/market_ticks/presentation/tick_stream_page.dart';
import 'package:example/market_ticks/presentation/tick_stream_cubit.dart';
import 'package:example/market_ticks/presentation/tick_stream_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'market_ticks/data/tick_stream_data_source.dart';

void main() => runApp(
      BlocProvider<TickSteamCubit>(
        create: (BuildContext context) => TickSteamCubit(
          TickStreamService(
            TickStreamRepoistory(TickStreamMapper(), TickStreamDataSource()),
          ),
        ),
        child: const App(),
      ),
    );

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: Scaffold(body: Center(child: TickStreamPage())),
      );
}
