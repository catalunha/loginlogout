import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_logout/app/logic/view/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = Get.find();
  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton.icon(
        icon: const Icon(Icons.login),
        label: const Text('Login with Google'),
        onPressed: () => _controller.signInWithGoogle(),
      )),
    );
  }
}
