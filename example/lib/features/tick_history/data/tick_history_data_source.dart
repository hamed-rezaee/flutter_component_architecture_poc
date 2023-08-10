import 'dart:async';

import 'package:example/core/web_socket_connection.dart';
import 'package:example/features/tick_history/data/base_tick_history_data_source.dart';
import 'package:example/features/tick_history/data/tick_history_model.dart';

class TickHistoryDataSource extends BaseTickSHistoryDataSource {
  TickHistoryDataSource(super.mapper);

  @override
  Future<TickHistoryModel> fetchTickHistory(String symbol, int count) {
    WebSocketConnection().request(
      <String, dynamic>{
        'ticks_history': symbol,
        'count': count,
        'end': 'latest',
        'style': 'ticks',
      },
    );

    return WebSocketConnection().response.transform(
      StreamTransformer<dynamic, TickHistoryModel>.fromHandlers(
        handleData: (dynamic event, EventSink<TickHistoryModel> sink) {
          if (event['msg_type'] == 'history') {
            final TickHistoryModel model = TickHistoryModel.fromJson(event);

            sink.add(model);
          }
        },
      ),
    ).first;
  }
}
