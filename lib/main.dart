import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_logout/firebase_options.dart';
import 'package:get/get.dart';
import 'package:login_logout/app/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Login',
      getPages: Routes.pageList,
      initialRoute: Routes.splash,
    );
  }
}
