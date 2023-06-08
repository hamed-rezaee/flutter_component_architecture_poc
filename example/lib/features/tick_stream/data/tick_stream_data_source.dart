import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:example/core/web_socket_connection.dart';
import 'package:example/features/tick_stream/data/tick_stream_model.dart';
import 'package:example/features/tick_stream/domain/base_tick_stream_data_source.dart';

class TickStreamDataSource extends BaseTickStreamDataSource {
  @override
  Stream<TickStreamModel> getTickStream(String symbol) {
    WebSocketConnection().addRequest(<String, dynamic>{'ticks': symbol});

    return WebSocketConnection().stream.transform(
      StreamTransformer<dynamic, TickStreamModel>.fromHandlers(
        handleData: (dynamic event, EventSink<TickStreamModel> sink) async {
          final Map<String, dynamic> data = json.decode(event);

          if (data['msg_type'] == 'tick' && data['tick']['symbol'] == symbol) {
            final TickStreamModel model = await Isolate.run(
              () => TickStreamModel.fromJson(data['tick']),
            );

            sink.add(model);
          }
        },
      ),
    );
  }
}
