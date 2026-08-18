import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;
  bool _onSecureText = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void togglePassword() {
    setState(() {
      _onSecureText = !_onSecureText;
      // print(_onSecureText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Hello')));
  }
}
