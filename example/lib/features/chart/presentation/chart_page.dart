import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:example/core/widgets/basic_chart/basic_chart.dart';
import 'package:example/features/chart/presentation/states/chart_cubit.dart';
import 'package:example/features/chart/presentation/states/chart_cubit_extended.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: BlocBuilder<ChartCubitExtended, ChartState>(
          builder: (BuildContext context, ChartState state) {
            if (state is ChartInitialState) {
              return const Text('Please select an active symbol.');
            } else if (state is ChartLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ChartLoadedState) {
              return state.data.length < 2
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                      width: double.infinity,
                      height: 128,
                      child: BasicChart(data: state.data),
                    );
            } else if (state is ChartErrorState) {
              return Text(state.message);
            }

            return const Text('Unknown State');
          },
        ),
      );
}
