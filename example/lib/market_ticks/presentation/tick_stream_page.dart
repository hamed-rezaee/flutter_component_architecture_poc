import 'package:example/market_ticks/presentation/tick_steam_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'tick_stream_cubit.dart';

class TickStreamPage extends StatelessWidget {
  const TickStreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TickSteamCubit>().getTickStream('R_100');

    return BlocBuilder<TickSteamCubit, TickStreamState>(
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
