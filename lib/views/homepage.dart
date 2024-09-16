import 'package:flutter/material.dart';
import 'package:overshare2/properties/button.dart';
import 'package:overshare2/repositories/authentication/authentication_repository.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyButton(
            text: "Logout",
            onPressed: () {
              AuthenticationRepository.instance.logoutUser();
            }),
      ),
    );
  }
}
