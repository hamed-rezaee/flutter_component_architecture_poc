import 'package:example/core/widgets/dialogs/dialog_page.dart';
import 'package:flutter/material.dart';

DialogPage<void> showLogoutDialog(
  BuildContext context,
  LogoutModel logoutModel,
) =>
    DialogPage<void>(
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Logout'),
        content:
            Text('Are you sure you want to logout ${logoutModel.loginId}?'),
        actions: <Widget>[
          TextButton(child: const Text('Yes'), onPressed: logoutModel.onLogout),
          TextButton(
            child: const Text('No'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );

class LogoutModel {
  LogoutModel(this.loginId, this.onLogout);

  final String loginId;
  final VoidCallback onLogout;
}
