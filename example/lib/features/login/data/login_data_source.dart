import 'dart:async';

import 'package:example/core/web_socket_connection.dart';
import 'package:example/features/login/data/base_login_data_source.dart';
import 'package:example/features/login/data/login_model.dart';

class LoginDataSource extends BaseLoginDataSource {
  LoginDataSource(super.mapper);

  @override
  Future<LoginModel> authorize(String token) {
    WebSocketConnection().request(<String, dynamic>{'authorize': token});

    return WebSocketConnection().response.transform(
      StreamTransformer<dynamic, LoginModel>.fromHandlers(
        handleData: (dynamic event, EventSink<LoginModel> sink) {
          if (event['msg_type'] == 'authorize') {
            final LoginModel model = LoginModel.fromJson(event['authorize']);

            sink.add(model);
          }
        },
      ),
    ).first;
  }

  @override
  Future<void> logout() =>
      WebSocketConnection().request(<String, dynamic>{'logout': 1});
}
