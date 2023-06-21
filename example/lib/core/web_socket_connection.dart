import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/io.dart';

class WebSocketConnection {
  factory WebSocketConnection() => _instance;

  WebSocketConnection._internal()
      : _channel = IOWebSocketChannel.connect(
          'wss://ws.binaryws.com/websockets/v3?app_id=1089',
        ) {
    _channel.stream
        .listen((dynamic event) => streamController.add(jsonDecode(event)));
  }

  static final WebSocketConnection _instance = WebSocketConnection._internal();

  late final IOWebSocketChannel _channel;

  void request(Map<String, dynamic> request) =>
      _channel.sink.add(jsonEncode(request));

  final StreamController<dynamic> streamController =
      StreamController<dynamic>.broadcast();

  Stream<dynamic> get response => streamController.stream;
}
