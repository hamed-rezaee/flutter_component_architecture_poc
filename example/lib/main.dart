import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'market_ticks/data/tick_stream_data_source.dart';
import 'market_ticks/data/tick_stream_mapper.dart';
import 'market_ticks/data/tick_stream_repository.dart';
import 'market_ticks/presentation/extended_tick_stream_cubit.dart';
import 'market_ticks/presentation/tick_stream_page.dart';
import 'market_ticks/presentation/tick_stream_service.dart';

void main() => runApp(
      BlocProvider<ExtendedTickStreamCubit>(
        create: (BuildContext context) => ExtendedTickStreamCubit(
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
  Widget build(BuildContext context) =>
      const MaterialApp(home: Scaffold(body: Center(child: TickStreamPage())));
}
