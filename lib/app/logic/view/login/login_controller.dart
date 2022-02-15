import 'package:get/get.dart';
import 'package:login_logout/app/logic/auth/auth_controller.dart';

class LoginController extends GetxController {
  final AuthController _authController;
  LoginController({required AuthController authController})
      : _authController = authController;

  signInWithGoogle() {
    _authController.signInWithGoogle();
  }
}
