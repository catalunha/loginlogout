import 'package:get/get.dart';
import 'package:login_logout/app/controllers/service/auth/auth_service.dart';

class LoginController extends GetxController {
  final AuthService _authService;
  LoginController({required AuthService authService})
      : _authService = authService;

  signInWithGoogle() async {
    await _authService.signInWithGoogle();
  }
}
