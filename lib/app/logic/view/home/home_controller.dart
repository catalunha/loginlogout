import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_logout/app/data/model/user_model.dart';
import 'package:login_logout/app/logic/auth/auth_controller.dart';

class HomeController extends GetxController {
  final AuthController _authController;
  HomeController({required AuthController authController})
      : _authController = authController;
  get userModel => _authController.userModel;
  get user => _authController.userFirebase;
  // User? user() {
  //   return _authController.userFirebase;
  // }

  // UserModel userModel() {
  //   return _authController.userModel;
  // }

  void signOut() async {
    _authController.signOut();
  }
}
