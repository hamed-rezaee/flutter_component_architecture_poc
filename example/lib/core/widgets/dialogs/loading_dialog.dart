import 'package:example/core/widgets/dialogs/dialog_page.dart';
import 'package:flutter/material.dart';

DialogPage<void> showLoadingDialog(BuildContext context, [String? message]) =>
    DialogPage<void>(
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircularProgressIndicator(),
                if (message != null)
                  Column(
                    children: <Widget>[
                      const SizedBox(height: 32),
                      Text(message),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
