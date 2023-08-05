import 'dart:async';

import 'package:example/core/web_socket_connection.dart';

import 'active_symbol_model.dart';
import 'base_active_symbol_data_source.dart';

class ActiveSymbolDataSource extends BaseActiveSymbolDataSource {
  ActiveSymbolDataSource(super.mapper);

  @override
  Future<List<ActiveSymbolModel>> fetchActiveSymbols() {
    WebSocketConnection().request(
      <String, dynamic>{
        'active_symbols': 'brief',
        'product_type': 'basic',
      },
    );

    return WebSocketConnection().response.transform(
      StreamTransformer<dynamic, List<ActiveSymbolModel>>.fromHandlers(
        handleData: (
          dynamic event,
          EventSink<List<ActiveSymbolModel>> sink,
        ) async {
          if (event['msg_type'] == 'active_symbols') {
            final List<ActiveSymbolModel> models = event['active_symbols']
                .map<ActiveSymbolModel>(
                  (dynamic item) => ActiveSymbolModel.fromJson(item),
                )
                .toList();

            sink.add(models);
          }
        },
      ),
    ).first;
  }
}
