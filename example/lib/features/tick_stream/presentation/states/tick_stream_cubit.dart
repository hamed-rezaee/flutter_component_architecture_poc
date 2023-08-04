import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';
import 'package:example/features/tick_stream/Interactor/base_tick_stream_service.dart';
import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';

part 'tick_stream_state.dart';

class TickSteamCubit extends Cubit<TickStreamState> {
  TickSteamCubit(this.service) : super(const TickStreamInitialState());

  final BaseTickStreamService service;

  StreamSubscription<TickStreamEntity>? _tickStreamSubscription;

  Future<void> fetchTickStream(
    ActiveSymbolEntity symbol, [
    int maxVisibleTicks = 50,
  ]) async {
    await _tickStreamSubscription?.cancel();

    if (state is TickStreamLoadedState) {
      final TickStreamLoadedState loadedState = state as TickStreamLoadedState;

      if (loadedState.ticks.isNotEmpty) {
        service.forgetTickStream(loadedState.ticks.first.id);
      }
    }

    emit(const TickStreamLoadingState());

    try {
      _tickStreamSubscription = service
          .fetchTickStream(symbol.symbol)
          .listen((TickStreamEntity tick) {
        final List<TickStreamEntity> ticks = <TickStreamEntity>[];

        if (state is TickStreamLoadedState) {
          final TickStreamLoadedState loadedState =
              state as TickStreamLoadedState;

          ticks.addAll(<TickStreamEntity>[...loadedState.ticks, tick]);

          if (ticks.length > maxVisibleTicks) {
            ticks.removeRange(0, ticks.length - maxVisibleTicks);
          }
        }

        emit(TickStreamLoadedState(ticks));
      });
    } on Exception catch (e) {
      emit(TickStreamErrorState('$e'));
    }
  }
}
