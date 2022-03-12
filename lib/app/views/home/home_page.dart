import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_logout/app/controllers/home/home_controller.dart';

class HomePage extends StatelessWidget {
  // final authController = Get.find<AuthController>();
  // final userController = Get.find<UserController>();

  final HomeController _homeController = Get.find();
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        actions: [
          IconButton(
              onPressed: () => _homeController.logout(),
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
            Obx(() => Text(_homeController.user?.uid ?? '...')),
            const Text('email:', style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_homeController.user?.email ?? '...')),
            const Text('displayName:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => Text(_homeController.user?.displayName ?? '...')),
            // const Text('phoneNumber:',
            //     style: TextStyle(fontWeight: FontWeight.bold)),
            // Obx(() => Text(_homeController.user?.phoneNumber ?? '...')),
            const Text('photoURL:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _homeController.user?.photoURL == null
                  ? const Icon(Icons.person)
                  : Image.network(_homeController.user!.photoURL!),
            ),
            // const Divider(color: Colors.red),
            // const Text('FIRESTORE:',
            //     style: TextStyle(fontWeight: FontWeight.bold)),
            // const Divider(),
            // const Text('ID Firestore:',
            //     style: TextStyle(fontWeight: FontWeight.bold)),
            // Obx(() => Text(_homeController.userModel.id)),
            // const Text('uid Firestore:',
            //     style: TextStyle(fontWeight: FontWeight.bold)),
            // Obx(() => Text(_homeController.userModel.uid)),
            // const Text('email Firestore:',
            //     style: TextStyle(fontWeight: FontWeight.bold)),
            // Obx(() => Text(_homeController.userModel.email)),
            // const Text('displayName Firestore:',
            //     style: TextStyle(fontWeight: FontWeight.bold)),
            // Obx(() => Text(_homeController.userModel.displayName ?? "...")),
            // const Text('photoURL Firestore:',
            //     style: TextStyle(fontWeight: FontWeight.bold)),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(20),
            //   child: _homeController.userModel?.photoURL == null
            //       ? const Icon(Icons.person)
            //       : Image.network(_homeController.userModel!.photoURL!),
            // ),
          ],
        ),
      ),
    );
  }
}
