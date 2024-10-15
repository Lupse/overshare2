import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:overshare2/features/authentication/login/controllers/login_controller.dart';
import 'package:overshare2/features/authentication/signup/controllers/phone_number_controller.dart';
import 'package:overshare2/features/authentication/signup/controllers/signup_controller.dart';
import 'package:overshare2/features/kalkulator/controllers/calculator_controller.dart';
import 'package:overshare2/features/news/controllers/favourite_controller.dart';
import 'package:overshare2/features/profile/user_profile/controllers/user_profile_controller.dart';
import 'package:overshare2/firebase_options.dart';
import 'package:overshare2/properties/snackbar.dart';
import 'package:overshare2/repositories/authentication/authentication_repository.dart';
import 'package:overshare2/repositories/authentication/user_repository.dart';
import 'package:overshare2/repositories/favourite_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));

  //controller
  Get.lazyPut(() => LoginController(), fenix: true);
  Get.lazyPut(() => SignupController(), fenix: true);
  Get.lazyPut(() => PhoneNumberController(), fenix: true);
  Get.lazyPut(() => ProfileController(), fenix: true);
  Get.lazyPut(() => CalculatorController(), fenix: true);
  Get.lazyPut(() => FavouriteController(), fenix: true);

  //repo
  Get.lazyPut(() => FavouriteRepository(), fenix: true);
  Get.lazyPut(() => UserRepository(), fenix: true);

  Get.lazyPut(() => Snackbar(), fenix: true);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // routes: {'/': (context) => NewsScreen()},
      home: Center(child: CircularProgressIndicator()),
    );
  }
}
