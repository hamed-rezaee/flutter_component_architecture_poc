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
