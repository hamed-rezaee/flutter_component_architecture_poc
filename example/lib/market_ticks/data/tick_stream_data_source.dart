import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/io.dart';

import '../domain/base_data_source.dart';

class TickStreamDataSource extends BaseDataSource {
  Stream<Map<String, dynamic>> getTickStream(String symbol) {
    final IOWebSocketChannel channel = IOWebSocketChannel.connect(
      'wss://ws.binaryws.com/websockets/v3?app_id=1089',
    );

    channel.sink.add(json.encode(<String, dynamic>{'ticks': symbol}));

    return channel.stream.transform(
      StreamTransformer<dynamic, Map<String, dynamic>>.fromHandlers(
        handleData: (dynamic event, EventSink<Map<String, dynamic>> sink) {
          final Map<String, dynamic> data = json.decode(event);

          if (data['msg_type'] == 'tick' && data['tick']['symbol'] == symbol) {
            sink.add(data['tick']);
          }
        },
      ),
    );
  }
}
