import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_logout/app/logic/view/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = Get.find();
  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Este App apenas testa login e logout'),
          Center(
            child: TextButton.icon(
              icon: const Icon(Icons.login),
              label: const Text('Selecione uma conta Google'),
              onPressed: () => _controller.signInWithGoogle(),
            ),
          ),
        ],
      ),
    );
  }
}
