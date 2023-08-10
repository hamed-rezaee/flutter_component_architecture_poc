import 'dart:async';

import 'package:example/core/web_socket_connection.dart';
import 'package:example/features/tick_stream/data/base_tick_stream_data_source.dart';
import 'package:example/features/tick_stream/data/tick_stream_model.dart';

class TickStreamDataSource extends BaseTickStreamDataSource {
  TickStreamDataSource(super.mapper);

  @override
  void forgetTickStream(String id) => WebSocketConnection().request(
        <String, dynamic>{'forget': id},
      );

  @override
  Stream<TickStreamModel> fetchTickStream(String symbol) {
    WebSocketConnection().request(<String, dynamic>{'ticks': symbol});

    return WebSocketConnection().response.transform(
      StreamTransformer<dynamic, TickStreamModel>.fromHandlers(
        handleData: (dynamic event, EventSink<TickStreamModel> sink) async {
          if (event['msg_type'] == 'tick') {
            if (event['tick']['symbol'] == symbol) {
              final TickStreamModel model =
                  TickStreamModel.fromJson(event['tick']);

              sink.add(model);
            }
          }
        },
      ),
    );
  }
}
