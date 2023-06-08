import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:example/features/tick_stream/data/tick_stream_data_source.dart';
import 'package:example/features/tick_stream/data/tick_stream_repository.dart';
import 'package:example/features/tick_stream/domain/tick_stream_mapper.dart';
import 'package:example/features/tick_stream/presentation/tick_stream_cubit_extended.dart';
import 'package:example/features/tick_stream/presentation/tick_stream_page.dart';
import 'package:example/features/tick_stream/presentation/tick_stream_service.dart';

void main() => runApp(
      BlocProvider<TickStreamCubitExtended>(
        create: (BuildContext context) => TickStreamCubitExtended(
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
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Layered Architecture'),
          ),
          body: const Padding(
            padding: EdgeInsets.all(8),
            child: TickStreamPage(),
          ),
        ),
      );
}
