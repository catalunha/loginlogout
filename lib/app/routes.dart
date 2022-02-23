import 'package:get/get.dart';
import 'package:login_logout/app/logic/service/auth/auth_bindinng.dart';
import 'package:login_logout/app/logic/view/home/home_binding.dart';
import 'package:login_logout/app/logic/view/login/login_binding.dart';
import 'package:login_logout/app/view/auth/auth_page.dart';
import 'package:login_logout/app/view/home/home_page.dart';
import 'package:login_logout/app/view/login/login_page.dart';

class Routes {
  static const splash = '/';
  static const splash2 = '/splash2';
  static const login = '/login';
  static const home = '/home';

  static final pageList = [
    GetPage(
      name: Routes.splash,
      binding: AuthBinding(),
      page: () => AuthPage(),
    ),
    GetPage(
      name: Routes.login,
      binding: LoginBinding(),
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.home,
      binding: HomeBinding(),
      page: () => HomePage(),
    ),
  ];
}
