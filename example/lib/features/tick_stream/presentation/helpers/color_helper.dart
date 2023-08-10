import 'package:example/features/tick_stream/presentation/enums/tick_state.dart';
import 'package:flutter/material.dart';

Color getColor(TickState state) {
  switch (state) {
    case TickState.up:
      return Colors.green;
    case TickState.down:
      return Colors.red;
    case TickState.none:
      return Colors.white;
  }
}
