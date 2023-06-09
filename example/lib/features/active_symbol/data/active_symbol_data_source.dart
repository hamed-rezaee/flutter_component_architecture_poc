import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:example/core/web_socket_connection.dart';
import 'package:example/features/active_symbol/data/active_symbol_model.dart';
import 'package:example/features/active_symbol/domain/base_active_symbol_data_source.dart';

class ActiveSymbolDataSource extends BaseActiveSymbolDataSource {
  @override
  Future<List<ActiveSymbolModel>> fetchActiveSymbols() async {
    WebSocketConnection().addRequest(
      <String, dynamic>{'active_symbols': 'brief', 'product_type': 'basic'},
    );

    return WebSocketConnection().stream.transform(
      StreamTransformer<dynamic, List<ActiveSymbolModel>>.fromHandlers(
        handleData:
            (dynamic event, EventSink<List<ActiveSymbolModel>> sink) async {
          final Map<String, dynamic> data = json.decode(event);

          if (data['msg_type'] == 'active_symbols') {
            final List<ActiveSymbolModel> models =
                await Isolate.run<List<ActiveSymbolModel>>(
              () => data['active_symbols']
                  .map<ActiveSymbolModel>(
                    (dynamic e) => ActiveSymbolModel.fromJson(e),
                  )
                  .toList(),
            );

            sink.add(models);
          }
        },
      ),
    ).first;
  }
}
