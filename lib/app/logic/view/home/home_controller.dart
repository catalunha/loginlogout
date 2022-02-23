import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_logout/app/data/model/user_model.dart';
import 'package:login_logout/app/logic/service/auth/auth_service.dart';

class HomeController extends GetxController {
  final AuthService _authService;
  HomeController({required AuthService authService})
      : _authService = authService;
  get userModel => _authService.userModel;
  get user => _authService.userFirebase;
  // User? user() {
  //   return _authService.userFirebase;
  // }

  // UserModel userModel() {
  //   return _authService.userModel;
  // }

  void signOut() async {
    _authService.signOut();
  }
}
