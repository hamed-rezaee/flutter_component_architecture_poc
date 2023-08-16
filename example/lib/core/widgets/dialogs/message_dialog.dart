import 'package:example/core/widgets/dialogs/dialog_page.dart';
import 'package:flutter/material.dart';

DialogPage<void> showMessageDialog(BuildContext context, String message) =>
    DialogPage<void>(
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Logout'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
