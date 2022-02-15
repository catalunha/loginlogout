import 'package:get/get.dart';
import 'package:login_logout/app/data/repository/user_repository.dart';
import 'package:login_logout/app/logic/auth/auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserRepository>(UserRepository());
    Get.put<AuthController>(AuthController(userRepository: Get.find()),
        permanent: true);
  }
}

// class AuthBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.put<AuthService>(
//         AuthService(loginRoute: Routes.login, homeRoute: Routes.home));
//     Get.lazyPut<AuthController>(() => AuthController(authService: Get.find()));
//   }
// }
