import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overshare2/features/authentication/signup/models/signup_model.dart';
import 'package:overshare2/repositories/authentication/authentication_repository.dart';
import 'package:overshare2/repositories/authentication/user_repository.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //get repo
  final getRepo = Get.put(UserRepository());

  //textfield controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final usernameController = TextEditingController();

  //signin up an user
  void signupUserAuth(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  Future<void> signupUserData(SignupModel user) async {
    await getRepo.signupUserData(user);
  }
}
