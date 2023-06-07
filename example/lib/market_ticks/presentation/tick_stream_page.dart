import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'tick_stream_cubit.dart';
import 'tick_stream_cubit_extended.dart';
import 'tick_stream_widget.dart';

class TickStreamPage extends StatelessWidget {
  const TickStreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TickStreamCubitExtended>().getTickStream('R_100');

    return BlocBuilder<TickStreamCubitExtended, TickStreamState>(
      builder: (BuildContext context, TickStreamState state) {
        if (state is TickStreamInitialState) {
          return const Center(child: Text('Initial State'));
        } else if (state is TickStreamLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TickStreamLoadedState) {
          return Center(child: TickStreamWidget(entity: state.tick));
        } else if (state is TickStreamErrorState) {
          return Center(child: Text(state.message));
        }

        return const Center(child: Text('Unknown State'));
      },
    );
  }
}
