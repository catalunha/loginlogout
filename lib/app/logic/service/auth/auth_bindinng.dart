import 'package:get/get.dart';
import 'package:login_logout/app/data/repository/user_repository.dart';
import 'package:login_logout/app/logic/service/auth/auth_service.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserRepository>(UserRepository());
    Get.put<AuthService>(AuthService(userRepository: Get.find()));
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
