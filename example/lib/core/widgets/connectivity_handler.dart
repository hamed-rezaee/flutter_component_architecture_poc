import 'package:example/core/connectivity_service/connectivity_service.dart';
import 'package:example/core/enums.dart';
import 'package:example/core/widgets/dialogs.dart';
import 'package:flutter/material.dart';

class ConnectivityHandler extends StatelessWidget {
  const ConnectivityHandler(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    bool _isShowingDialog = false;

    ConnectivityService().connectivityStatus.listen((ConnectivityStatus event) {
      if (event == ConnectivityStatus.connected) {
        if (_isShowingDialog) {
          _isShowingDialog = false;

          Navigator.of(context).pop();
        }
      } else {
        if (!_isShowingDialog) {
          _isShowingDialog = true;

          showLoadingDialog(context);
        }
      }
    });

    return child;
  }
}
