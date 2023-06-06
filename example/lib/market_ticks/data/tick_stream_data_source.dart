import 'dart:convert';

import 'package:web_socket_channel/io.dart';

import '../domain/base_data_source.dart';

class TickStreamDataSource extends BaseDataSource {
  Stream<Map<String, dynamic>> getTickStream(String symbol) {
    final IOWebSocketChannel channel = IOWebSocketChannel.connect(
      'wss://ws.binaryws.com/websockets/v3?app_id=1089',
    );

    channel.sink.add(json.encode(<String, dynamic>{'ticks': symbol}));

    return channel.stream.where(
      (dynamic event) {
        final Map<String, dynamic> eventMap = json.decode(event);

        return eventMap['msg_type'] == 'tick' &&
            eventMap['tick']['symbol'] == symbol;
      },
    ).map((dynamic event) => json.decode(event)['tick']);
  }
}
