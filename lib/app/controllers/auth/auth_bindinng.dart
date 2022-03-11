import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_logout/app/models/repository/user_repository.dart';
import 'package:login_logout/app/controllers/service/auth/auth_service.dart';

class AuthBinding2 implements Bindings {
  @override
  void dependencies() {
    Get.put<FirebaseAuth>(FirebaseAuth.instance);
  }
}
