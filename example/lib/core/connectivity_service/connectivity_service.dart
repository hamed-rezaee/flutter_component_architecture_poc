import 'dart:async';

import 'package:dart_web_socket_handler/web_socket_handler.dart';
import 'package:example/core/connectivity_service/base_connectivity_service.dart';
import 'package:example/core/enums.dart';
import 'package:example/core/extensions/converters.dart';
import 'package:example/core/web_socket_connection.dart';

class ConnectivityService implements BaseConnectivityService {
  factory ConnectivityService() => _instance;

  ConnectivityService._();

  static final ConnectivityService _instance = ConnectivityService._();

  @override
  Stream<ConnectivityStatus> get connectivityStatus => WebSocketConnection()
      .connectionState
      .transform(
        StreamTransformer<ConnectionState, ConnectivityStatus>.fromHandlers(
          handleData: (
            ConnectionState event,
            EventSink<ConnectivityStatus> sink,
          ) =>
              sink.add(event.connectivityStatus),
        ),
      )
      .distinct();
}
