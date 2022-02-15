import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_logout/app/logic/view/home/home_controller.dart';

class HomePage extends StatelessWidget {
  // final authController = Get.find<AuthController>();
  // final userController = Get.find<UserController>();

  final HomeController _controller = Get.find();
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        actions: [
          IconButton(
              onPressed: () => _controller.signOut(),
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(color: Colors.red),
            const Text('AUTH:', style: TextStyle(fontWeight: FontWeight.bold)),
            const Divider(),
            const Text('uid:', style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_controller.user?.uid ?? '...')),
            const Text('email:', style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_controller.user?.email ?? '...')),
            const Text('displayName:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_controller.user?.displayName ?? '...')),
            // const Text('phoneNumber:',
            //     style: TextStyle(fontWeight: FontWeight.bold)),
            // Obx(() => Text(_controller.user?.phoneNumber ?? '...')),
            const Text('photoURL:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _controller.user?.photoURL == null
                  ? const Icon(Icons.person)
                  : Image.network(_controller.user!.photoURL!),
            ),
            const Divider(color: Colors.red),
            const Text('FIRESTORE:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Divider(),
            const Text('ID Firestore:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_controller.userModel.id)),
            const Text('uid Firestore:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_controller.userModel.uid)),
            const Text('email Firestore:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_controller.userModel.email)),
            const Text('displayName Firestore:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_controller.userModel.displayName ?? "...")),
            const Text('photoURL Firestore:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _controller.userModel?.photoURL == null
                  ? const Icon(Icons.person)
                  : Image.network(_controller.userModel!.photoURL!),
            ),
          ],
        ),
      ),
    );
  }
}
