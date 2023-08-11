import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade900,
            ),
            child: const CircularProgressIndicator()),
      );
}

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    required this.model,
    super.key,
  });

  final LogoutModel model;

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text('Logout'),
        content: Text('Are you sure you want to logout ${model.loginId}?'),
        actions: <Widget>[
          TextButton(child: const Text('Yes'), onPressed: model.onLogout),
          TextButton(
            child: const Text('No'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
}

class LogoutModel {
  LogoutModel(this.loginId, this.onLogout);

  final String loginId;
  final VoidCallback onLogout;
}
