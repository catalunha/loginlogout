import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_logout/app/logic/auth/auth_controller.dart';

class SplashPage extends StatelessWidget {
  final AuthController _controller = Get.find();
  SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // _controller.irPara();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bem vindo.'),
            const Text('Atualizando informações...'),
            const CircularProgressIndicator(),
            // Obx(() => Text('email: ${_controller.irPara() ?? "..."}'))
          ],
        ),
      ),
    );
  }
}
