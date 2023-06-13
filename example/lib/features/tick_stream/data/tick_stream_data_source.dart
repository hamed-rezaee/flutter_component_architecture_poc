import 'dart:async';
import 'dart:isolate';

import 'package:example/core/web_socket_connection.dart';
import 'package:example/features/tick_stream/data/tick_stream_model.dart';
import 'package:example/features/tick_stream/data/base_tick_stream_data_source.dart';

class TickStreamDataSource extends BaseTickStreamDataSource {
  @override
  void forgetTickStream() => WebSocketConnection()
      .addRequest(<String, dynamic>{'forget_all': 'ticks'});

  @override
  Stream<TickStreamModel> fetchTickStream(String symbol) {
    WebSocketConnection().addRequest(<String, dynamic>{'ticks': symbol});

    return WebSocketConnection().stream.transform(
      StreamTransformer<dynamic, TickStreamModel>.fromHandlers(
        handleData: (dynamic event, EventSink<TickStreamModel> sink) async {
          if (event['msg_type'] == 'tick' &&
              event['tick']['symbol'] == symbol) {
            final TickStreamModel model = await Isolate.run(
              () => TickStreamModel.fromJson(event['tick']),
            );

            sink.add(model);
          }
        },
      ),
    );
  }
}
