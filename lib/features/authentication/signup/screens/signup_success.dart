import 'dart:async'; // Import dart:async for Timer
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/authentication/signup/controllers/phone_number_controller.dart';
import 'package:overshare2/features/authentication/signup/controllers/signup_controller.dart';
import 'package:overshare2/features/authentication/signup/models/signup_model.dart';
import 'package:overshare2/properties/snackbar.dart';
import 'package:overshare2/views/homepage/landing.dart';

class SignupSuccess extends StatefulWidget {
  const SignupSuccess({super.key});

  @override
  SignupSuccessState createState() => SignupSuccessState();
}

class SignupSuccessState extends State<SignupSuccess> {
  final Snackbar snackbar = Get.find();
  final signUpControllerInstance = Get.find<SignupController>();
  final phoneNumberControllerInstance = Get.find<PhoneNumberController>();
  int _counter = 3;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    countdown();
  }

  void countdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        timer.cancel(); // Cancel timer when counter reaches 0
        final user = SignupModel(
            username: signUpControllerInstance.usernameController.text.trim(),
            phone: phoneNumberControllerInstance.getPhoneNumber(),
            email: signUpControllerInstance.emailController.text.trim(),
            password: signUpControllerInstance.passwordController.text.trim());
        signUpControllerInstance.signupUserData(user);
        if (Get.isSnackbarOpen == false) {
          ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(SnackBar(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.all(0),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: snackbar.successSnackbar('Success', 'Login Success'),
            duration: const Duration(seconds: 3),
          ));
          Get.offAll(() => const Homepage());
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Ensure the timer is canceled if the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFF151515)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/signupsuccess.png')),
            // Title
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                "Congratulation!",
                style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                    fontSize: 34.35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Text
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Your account has been registered",
                style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Text
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 50, right: 50),
              child: Text(
                "Automatically directed to Login in $_counter seconds",
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(105, 228, 228, 228),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
