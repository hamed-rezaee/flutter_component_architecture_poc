import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();

  String? _errorText;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
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
          ),
        ),
      );

  void _validateInput() {
    if (_controller.value.text.isEmpty) {
      _errorText = 'Please enter a token.';

      setState(() {});

      return;
    }

    if (_errorText == null) {
      context.go('/home_page');
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
