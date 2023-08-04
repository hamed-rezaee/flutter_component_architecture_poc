import 'dart:async';
import 'dart:convert';

import 'package:dart_web_socket_handler/web_socket_handler.dart';

class WebSocketConnection {
  factory WebSocketConnection() => _instance;

  WebSocketConnection._internal()
      : _channel = WebSocket(
          Uri.parse('wss://ws.binaryws.com/websockets/v3?app_id=1089'),
        ) {
    _channel.messages
        .listen((dynamic event) => streamController.add(jsonDecode(event)));
  }

  static final WebSocketConnection _instance = WebSocketConnection._internal();

  late final WebSocket _channel;

  Future<void> request(Map<String, dynamic> request) async =>
      _channel.send(jsonEncode(request));

  final StreamController<dynamic> streamController =
      StreamController<dynamic>.broadcast();

  Stream<dynamic> get response => streamController.stream;

  Stream<ConnectionState> get connectionState => _channel.connection;
}
