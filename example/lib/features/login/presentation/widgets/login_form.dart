import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({required this.onLoginPressed, super.key});

  final void Function(String token) onLoginPressed;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _controller =
      TextEditingController(text: 'kd4fE1MpTI0UksF');

  String? _errorText;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'API Token',
              errorText: _errorText,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            child: const Text('Login'),
            onPressed: _validateInput,
          )
        ],
      );

  void _validateInput() {
    if (_controller.value.text.isEmpty) {
      _errorText = 'Please enter a token.';

      setState(() {});

      return;
    }

    widget.onLoginPressed(_controller.value.text);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
