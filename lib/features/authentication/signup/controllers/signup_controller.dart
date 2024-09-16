import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overshare2/repositories/authentication/authentication_repository.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //textfield controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  //signin up an user
  void signUpUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }
}
