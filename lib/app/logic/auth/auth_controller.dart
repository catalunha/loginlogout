import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_logout/app/data/exceptions/user_exceptions.dart';
import 'package:login_logout/app/data/model/user_model.dart';
import 'package:login_logout/app/data/repository/user_repository.dart';
import 'package:login_logout/app/routes.dart';

class AuthController extends GetxController {
  final UserRepository _userRepository;
  AuthController({required UserRepository userRepository})
      : _userRepository = userRepository;

  final FirebaseAuth _firebaseAuthInstance = FirebaseAuth.instance;
  Rx<User?> userFirebaseAuth = Rx<User?>(FirebaseAuth.instance.currentUser);
  User? get userFirebase => userFirebaseAuth.value;
  final Rx<UserModel> _userModel = UserModel(id: '', uid: '', email: '').obs;
  UserModel get userModel => _userModel.value;

  @override
  void onInit() {
    userFirebaseAuth.bindStream(_firebaseAuthInstance.authStateChanges());
    ever<User?>(userFirebaseAuth, (user) async {
      if (userFirebaseAuth.value == null) {
        log('User is SIGNED OUT!');
        Get.offNamed(Routes.login);
      } else {
        log('User is signed in!');
        Get.offNamed(Routes.splash2);

        try {
          _userModel(await _userRepository.getByUid(user!.uid));
          log(_userModel.toString());
          Get.offNamed(Routes.home);
        } on UserNotFoundException catch (e, s) {
          if (user == null) {
            throw Exception();
          }
          UserModel tempUserModel = UserModel(
            id: '',
            uid: user.uid,
            email: user.email!,
            displayName: user.displayName,
            photoURL: user.photoURL,
          );
          try {
            await _userRepository.create(tempUserModel.toMap());
            Future.delayed(const Duration(seconds: 1));
            _userModel(await _userRepository.getByUid(user.uid));
            Future.delayed(const Duration(seconds: 1));
            Get.offNamed(Routes.home);
          } on UserNotFoundException catch (e, s) {
            Get.snackbar(
              'Erro. ',
              'Novo usuario. Mas não encontrado. ${s.toString()}',
              snackPosition: SnackPosition.BOTTOM,
            );
            Get.offNamed(Routes.login);
          } on UserMoreThanOneException catch (e, s) {
            Get.snackbar(
              'Erro.',
              'Novo usuario. Mais duplicação encontrada. ${s.toString()}',
              snackPosition: SnackPosition.BOTTOM,
            );
            Get.offNamed(Routes.login);
          } catch (e, s) {
            Get.snackbar(
              'Erro.',
              'Novo usuario. Tente novamente por favor. ${s.toString()}',
              snackPosition: SnackPosition.BOTTOM,
            );
            Get.offNamed(Routes.login);
          }
        } on UserMoreThanOneException catch (e, s) {
          Get.snackbar(
            'Erro.',
            'Mais de um usuario encontrado. ${s.toString()}',
            snackPosition: SnackPosition.BOTTOM,
          );
          Get.offNamed(Routes.login);
        }
      }
    });
    super.onInit();
  }

  Future<UserCredential?> signInWithGoogle() async {
    // UserCredential? userCredential;
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredential
      return await _firebaseAuthInstance.signInWithCredential(credential);
    } catch (error) {
      Get.snackbar(
        'Erro ao buscar conta do Google',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return null;
  }

  void signOut() async {
    await _firebaseAuthInstance.signOut();
    await GoogleSignIn().signOut();
    // await GoogleSignIn().disconnect();
  }
}
