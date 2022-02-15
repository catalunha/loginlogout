import 'package:get/get.dart';
import 'package:login_logout/app/logic/view/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
        () => LoginController(authController: Get.find()));
  }
}
