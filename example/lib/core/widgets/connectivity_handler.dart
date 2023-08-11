import 'package:example/core/connectivity_service/connectivity_service.dart';
import 'package:example/core/enums.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConnectivityHandler extends StatelessWidget {
  const ConnectivityHandler(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    ConnectivityService().connectivityStatus.listen((ConnectivityStatus event) {
      if (event == ConnectivityStatus.connected) {
        if (GoRouter.of(context).namedLocation('loading_dialog').isEmpty) {
          context.pop();
        }
      } else {
        context.go('/loading_dialog');
      }
    });

    return child;
  }
}
