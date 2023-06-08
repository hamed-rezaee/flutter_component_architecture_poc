import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:example/market_ticks/data/tick_stream_model.dart';
import 'package:web_socket_channel/io.dart';

import '../domain/base_tick_stream_data_source.dart';

class TickStreamDataSource extends BaseTickStreamDataSource {
  @override
  Stream<TickStreamModel> getTickStream(String symbol) {
    final IOWebSocketChannel channel = IOWebSocketChannel.connect(
      'wss://ws.binaryws.com/websockets/v3?app_id=1089',
    );

    channel.sink.add(json.encode(<String, dynamic>{'ticks': symbol}));

    return channel.stream.transform(
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
