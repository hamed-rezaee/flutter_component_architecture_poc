import 'package:example/features/active_symbol/presentation/active_symbol_entity.dart';
import 'package:example/features/active_symbol/presentation/selected_active_symbol_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

import 'package:example/features/active_symbol/presentation/active_symbol_widget.dart';
import 'package:example/features/active_symbol/presentation/active_symbol_cubit.dart';

class ActiveSymbolPage extends StatelessWidget {
  const ActiveSymbolPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ActiveSymbolCubit, ActiveSymbolState>(
        bloc: BlocManager.instance.fetch<ActiveSymbolCubit>()
          ..fetchActiveSymbols(),
        builder: (BuildContext context, ActiveSymbolState activeSymbolState) {
          if (activeSymbolState is ActiveSymbolInitialState) {
            return const Center(child: Text('Initial State'));
          } else if (activeSymbolState is ActiveSymbolLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (activeSymbolState is ActiveSymbolLoadedState) {
            return BlocBuilder<SelectedActiveSymbolCubit,
                SelectedActiveSymbolState>(
              bloc: BlocManager.instance.fetch<SelectedActiveSymbolCubit>(),
              builder: (
                BuildContext context,
                SelectedActiveSymbolState state,
              ) =>
                  ActiveSymbolWidget(
                activeSymbols: activeSymbolState.activeSymbols,
                selectedActiveSymbol: state.activeSymbol,
                onChanged: (ActiveSymbolEntity entity) => BlocManager.instance
                    .fetch<SelectedActiveSymbolCubit>()
                    .updateActiveSymbol(entity),
              ),
            );
          } else if (activeSymbolState is ActiveSymbolErrorState) {
            return Center(child: Text(activeSymbolState.message));
          }

          return const Center(child: Text('Unknown State'));
        },
      );
}
