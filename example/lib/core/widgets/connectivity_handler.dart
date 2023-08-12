import 'package:example/core/connectivity_service/connectivity_service.dart';
import 'package:example/core/enums.dart';
import 'package:example/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConnectivityHandler extends StatelessWidget {
  const ConnectivityHandler(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    ConnectivityService().connectivityStatus.listen((ConnectivityStatus event) {
      if (event == ConnectivityStatus.connected) {
        if (context.canPop()) {
          context.pop();
        }
      } else {
        context.push(
          loadingDialogPath,
          extra: 'No Internet Connection, Try to reconnect...',
        );
      }
    });

    return child;
  }
}
