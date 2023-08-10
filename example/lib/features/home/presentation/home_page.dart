import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit.dart';
import 'package:flutter/material.dart';

import 'package:example/features/active_symbol/presentation/widgets/active_symbol.dart';
import 'package:example/features/tick_stream/presentation/widgets/tick_stream.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../tick_stream/presentation/states/tick_stream_cubit_extended.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool chartPageIsEnabled = false;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Architecture Demo'),
        actions: <Widget>[
          BlocConsumer<TickStreamCubitExtended, TickStreamState>(
            listener: (BuildContext context, TickStreamState state) =>
                chartPageIsEnabled = state is TickStreamLoadedState,
            builder: (BuildContext context, TickStreamState state) =>
                IconButton(
              icon: const Icon(Icons.ssid_chart_rounded),
              onPressed:
                  chartPageIsEnabled ? () => context.push('/chart') : null,
            ),
          ),
        ],
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
  }
}
