import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';
import 'package:example/features/active_symbol/presentation/states/active_symbol_cubit.dart';
import 'package:example/features/active_symbol/presentation/states/selected_active_symbol_cubit.dart';
import 'package:example/features/active_symbol/presentation/states/selected_active_symbol_cubit_extended.dart';
import 'package:example/features/active_symbol/presentation/widgets/active_symbol_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveSymbol extends StatelessWidget {
  const ActiveSymbol({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ActiveSymbolCubit, ActiveSymbolState>(
        bloc: context.read<ActiveSymbolCubit>()..fetchActiveSymbols(),
        builder: (BuildContext context, ActiveSymbolState activeSymbolState) {
          if (activeSymbolState is ActiveSymbolInitialState) {
            return const Center(child: Text('Initial State'));
          }

          if (activeSymbolState is ActiveSymbolLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (activeSymbolState is ActiveSymbolLoadedState) {
            return BlocBuilder<SelectedActiveSymbolCubitExtended,
                SelectedActiveSymbolState>(
              builder: (
                BuildContext context,
                SelectedActiveSymbolState state,
              ) =>
                  ActiveSymbolDropdown(
                activeSymbols: activeSymbolState.activeSymbols,
                selectedActiveSymbol: state.activeSymbol,
                onChanged: (ActiveSymbolEntity symbol) => context
                    .read<SelectedActiveSymbolCubitExtended>()
                    .updateActiveSymbol(activeSymbol: symbol),
              ),
            );
          }

          if (activeSymbolState is ActiveSymbolErrorState) {
            return Center(child: Text(activeSymbolState.message));
          }

          return const Center(child: Text('Unknown State'));
        },
      );
}
