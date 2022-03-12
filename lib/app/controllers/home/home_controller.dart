import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:login_logout/app/controllers/auth/auth_controller.dart';
import 'package:login_logout/app/controllers/mixins/loader_mixin.dart';
import 'package:login_logout/app/controllers/mixins/message_mixin.dart';

class HomeController extends GetxController with LoaderMixin, MessageMixin {
  final AuthController _authController;
  HomeController({required AuthController authController})
      : _authController = authController;
  get user => _authController.user;
  // User? user() {
  //   return _authService.userFirebase;
  // }

  // UserModel userModel() {
  //   return _authService.userModel;
  // }

  void logout() async {
    _authController.logout();
  }
}
