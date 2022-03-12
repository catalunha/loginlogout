import 'package:get/get.dart';
import 'package:login_logout/app/controllers/auth/auth_binding.dart';
import 'package:login_logout/app/controllers/auth/login/login_binding.dart';
import 'package:login_logout/app/controllers/auth/register/register_binding.dart';
import 'package:login_logout/app/controllers/home/home_binding.dart';
import 'package:login_logout/app/views/auth/login/login_page.dart';
import 'package:login_logout/app/views/auth/register/register_page.dart';
import 'package:login_logout/app/views/home/home_page.dart';
import 'package:login_logout/app/views/splash/splash_page.dart';

class Routes {
  static const splash = '/';
  static const authLogin = '/auth/login';
  static const authRegister = '/auth/register';
  static const home = '/home';

  static final pageList = [
    GetPage(
      name: Routes.splash,
      binding: AuthBinding(),
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.authLogin,
      binding: LoginBinding(),
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.authRegister,
      binding: RegisterBinding(),
      page: () => RegisterPage(),
    ),
    GetPage(
      name: Routes.home,
      binding: HomeBinding(),
      page: () => HomePage(),
    ),
  ];
}
