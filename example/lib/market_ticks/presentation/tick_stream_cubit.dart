import 'package:flutter_bloc/flutter_bloc.dart';

import 'tick_stream_entity.dart';
import 'tick_stream_service.dart';

part 'tick_stream_state.dart';

class TickSteamCubit extends Cubit<TickStreamState> {
  TickSteamCubit(this.service) : super(const TickStreamInitialState());

  final TickStreamService service;

  void getTickStream(String symbol) {
    emit(const TickStreamLoadingState());

    try {
      service.getTickStream(symbol).listen((TickStreamEntity tick) {
        emit(TickStreamLoadedState(tick));
      });
    } on Exception catch (e) {
      emit(TickStreamErrorState('$e'));
    }
  }
}
