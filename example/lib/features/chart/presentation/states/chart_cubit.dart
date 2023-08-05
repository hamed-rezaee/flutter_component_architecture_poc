import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:example/core/widgets/basic_chart/basic_chart_model.dart';
import 'package:example/features/tick_stream/Interactor/base_tick_stream_service.dart';

part 'chart_state.dart';

class ChartCubit extends Cubit<ChartState> {
  ChartCubit(this.service) : super(const ChartInitialState());

  final BaseTickStreamService service;
}
