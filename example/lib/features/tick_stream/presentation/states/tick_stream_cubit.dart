import 'dart:async';

import 'package:example/features/tick_stream/Interactor/base_tick_stream_service.dart';
import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tick_stream_state.dart';

class TickSteamCubit extends Cubit<TickStreamState> {
  TickSteamCubit(this.service) : super(const TickStreamInitialState());

  final BaseTickStreamService service;

  StreamSubscription<TickStreamEntity>? _tickStreamSubscription;

  Future<void> reset(String? symbol) async {
    emit(const TickStreamLoadingState());

    await _tickStreamSubscription?.cancel();

    if (symbol == null) {
      emit(const TickStreamInitialState());
    }
  }

  Future<void> fetchTickStream(
    String? symbol, [
    int maxVisibleTicks = 50,
  ]) async {
    await reset(symbol);

    if (symbol == null) {
      return;
    }

    try {
      _tickStreamSubscription = service
          .fetchTickStream(symbol)
          .listen((TickStreamEntity tick) => emit(TickStreamLoadedState(tick)))
        ..onError((Object e) => emit(TickStreamErrorState('$e')));
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
