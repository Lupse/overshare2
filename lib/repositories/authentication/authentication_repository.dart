import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overshare2/features/authentication/signup/screens/signup_success.dart';
import 'package:overshare2/properties/snackbar.dart';
import 'package:overshare2/repositories/authentication/exception/signup_exception.dart';
import 'package:overshare2/views/homepage.dart';
import 'package:overshare2/views/landing_page.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final Snackbar snackbar = Get.find();

  // variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  RxBool isLoading = false.obs;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 1));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  String? get userId => firebaseUser.value?.uid;

  _setInitialScreen(User? user) {
    user == null
        ? Get.to(() => const LandingPage())
        : Get.offAll(() => const Homepage());
  }

// SignUp
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      firebaseUser.value != null
          ? Get.offAll(() => const SignupSuccess())
          : Get.to(() => const LandingPage());
    } on FirebaseAuthException catch (e) {
      final ex = AuthException.code(e.code);
      // print('FIREBASE AUTH EXCEPTION - ${ex.message}');

      //showing snackbar using getx dependency
      if (Get.isSnackbarOpen == false) {
        ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(SnackBar(
          clipBehavior: Clip.none,
          padding: const EdgeInsets.all(0),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: snackbar.errorSnackbar("Error", ex.message),
          duration: const Duration(seconds: 2),
        ));
      }
    } catch (_) {
      const ex = AuthException();
      // print('FIREBASE AUTH EXCEPTION - ${ex.message}');

      //show snackbar using getx
      if (Get.isSnackbarOpen == false) {
        ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(SnackBar(
          clipBehavior: Clip.none,
          padding: const EdgeInsets.all(0),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: snackbar.errorSnackbar("Error", ex.message),
          duration: const Duration(seconds: 2),
        ));
      }
      throw ex;
    } finally {
      //try sudah selesai
      isLoading.value = false;
    }
  }

// Login
  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (firebaseUser.value != null) {
        ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(SnackBar(
          clipBehavior: Clip.none,
          padding: const EdgeInsets.all(0),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: snackbar.successSnackbar("Success", "Login Success"),
          duration: const Duration(seconds: 2),
        ));
        Get.offAll(const Homepage());
      }
    } on FirebaseAuthException catch (e) {
      final ex = AuthException.code(e.code);
      // print(e.code);
      // print('FIREBASE AUTH EXCEPTION - ${ex.message}');

      //show snackbar using getx
      if (Get.isSnackbarOpen == false) {
        ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(SnackBar(
          clipBehavior: Clip.none,
          padding: const EdgeInsets.all(0),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: snackbar.errorSnackbar("Error", ex.message),
          duration: const Duration(seconds: 2),
        ));
      }
    } catch (_) {
      const ex = AuthException();

      //show snackbar using getx
      if (Get.isSnackbarOpen == false) {
        ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(SnackBar(
          clipBehavior: Clip.none,
          padding: const EdgeInsets.all(0),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: snackbar.errorSnackbar("Error", ex.message),
          duration: const Duration(seconds: 2),
        ));
      }
      // print('FIREBASE AUTH EXCEPTION - ${ex.message}');
    } finally {
      //try sudah selesai
      isLoading.value = false;
    }
  }

  Future<void> logoutUser() async => await _auth.signOut();
}
