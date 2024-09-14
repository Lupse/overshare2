import 'dart:async'; // Import dart:async for Timer
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/views/login.dart';

class SignupSuccess extends StatefulWidget {
  const SignupSuccess({super.key});

  @override
  SignupSuccessState createState() => SignupSuccessState();
}

class SignupSuccessState extends State<SignupSuccess> {
  @override
  void initState() {
    super.initState();
    // Set a timer to navigate to the Login page after 5 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Automatically directed to Login in 3 seconds",
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
