import 'package:example/features/active_symbol/presentation/active_symbol_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:example/features/tick_stream/domain/base_tick_stream_service.dart';
import 'package:example/features/tick_stream/presentation/tick_stream_entity.dart';

part 'tick_stream_state.dart';

class TickSteamCubit extends Cubit<TickStreamState> {
  TickSteamCubit(this.service) : super(const TickStreamInitialState());

  final BaseTickStreamService service;

  void fetchTickStream(ActiveSymbolEntity symbol) {
    emit(const TickStreamLoadingState());

    try {
      service.forgetTickStream();

      service.fetchTickStream(symbol.symbol).listen((TickStreamEntity tick) {
        emit(TickStreamLoadedState(tick));
      });
    } on Exception catch (e) {
      emit(TickStreamErrorState('$e'));
    }
  }
}
