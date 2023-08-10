import 'dart:async';

import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';
import 'package:example/features/tick_stream/Interactor/base_tick_stream_service.dart';
import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    emit(const TickStreamLoadingState());

    try {
      _tickStreamSubscription = service
          .fetchTickStream(symbol.symbol)
          .listen((TickStreamEntity tick) => emit(TickStreamLoadedState(tick)));
    } on Exception catch (e) {
      emit(TickStreamErrorState('$e'));
    }
  }

  @override
  Future<void> close() {
    _tickStreamSubscription?.cancel();

    return super.close();
  }
}
