import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:example/features/active_symbol/domain/base_active_symbol_service.dart';
import 'package:example/features/active_symbol/presentation/active_symbol_entity.dart';

part 'active_symbol_state.dart';

class ActiveSymbolCubit extends Cubit<ActiveSymbolState> {
  ActiveSymbolCubit(this.service) : super(const ActiveSymbolInitialState());

  final BaseActiveSymbolService service;

  Future<void> fetchActiveSymbols() async {
    emit(const ActiveSymbolLoadingState());

    try {
      emit(ActiveSymbolLoadedState(await service.fetchActiveSymbols()));
    } on Exception catch (e) {
      emit(ActiveSymbolErrorState('$e'));
    }
  }
}
