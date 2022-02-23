import 'package:get/get.dart';
import 'package:login_logout/app/logic/view/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(authService: Get.find()));
  }
}
