import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_logout/app/logic/auth/auth_controller.dart';

class Splash2Page extends StatelessWidget {
  const Splash2Page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // _controller.irPara();
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Buscando dados de sua conta...'),
            const CircularProgressIndicator(),
            // Obx(() => Text('email: ${_controller.irPara() ?? "..."}'))
          ],
        ),
      ),
    );
  }
}
