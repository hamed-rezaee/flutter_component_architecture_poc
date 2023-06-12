import 'package:flutter/material.dart';
import 'package:flutter_deriv_bloc_manager/manager.dart';

import 'package:example/features/tick_stream/presentation/basic_chart.dart';
import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit.dart';
import 'package:example/features/tick_stream/presentation/states/tick_stream_cubit_extended.dart';
import 'package:example/features/tick_stream/presentation/tick_stream_widget.dart';

class TickStreamPage extends StatelessWidget {
  const TickStreamPage({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: BlocManagerBuilder<TickStreamCubitExtended, TickStreamState>(
          builder: (BuildContext context, TickStreamState state) {
            if (state is TickStreamInitialState) {
              return const Text('Please select an active symbol.');
            } else if (state is TickStreamLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TickStreamLoadedState) {
              return state.ticks.isEmpty
                  ? const Text('Waiting for data...')
                  : Column(
                      children: <Widget>[
                        TickStreamWidget(entity: state.tick),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          height: 96,
                          child: BasicChart(ticks: state.ticks),
                        ),
                      ],
                    );
            } else if (state is TickStreamErrorState) {
              return Text(state.message);
            }

            return const Text('Unknown State');
          },
        ),
      );
}
