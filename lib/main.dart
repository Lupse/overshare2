import 'package:flutter/material.dart';
import 'package:overshare2/views/landing_page.dart';
import 'package:overshare2/views/signup_success.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SignupSuccess());
  }
}
