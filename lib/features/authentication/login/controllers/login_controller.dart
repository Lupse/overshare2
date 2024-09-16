import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overshare2/repositories/authentication/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  void loginUser(String email, String password) {
    AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password);
  }
}
