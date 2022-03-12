import 'package:get/get.dart';
import 'package:login_logout/app/controllers/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
        () => HomeController(authController: Get.find()));
  }
}
