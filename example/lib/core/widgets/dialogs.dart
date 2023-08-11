import 'package:flutter/material.dart';

Future<void> showLoadingDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) => Center(
        child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade900,
            ),
            child: const CircularProgressIndicator()),
      ),
    );

Future<void> logoutDialog(
  BuildContext context,
  String loginId,
  VoidCallback onLogout,
) =>
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Logout'),
        content: Text('Are you sure you want to logout $loginId?'),
        actions: <Widget>[
          TextButton(child: const Text('Yes'), onPressed: onLogout),
          TextButton(
            child: const Text('No'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
