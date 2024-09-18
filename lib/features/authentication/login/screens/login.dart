import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/authentication/login/controllers/login_controller.dart';
import 'package:overshare2/properties/appbars.dart';
import 'package:overshare2/properties/button.dart';
import 'package:overshare2/properties/textfield.dart';
import 'package:overshare2/features/authentication/signup/screens/signup.dart';

//sizedbox dihilangkan karna tidak bisa melakukan input email maupun password
//tolong dibantuu

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final loginController = Get.put(LoginController());

    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: MyAppBar(
            withLeading: false,
            backgroundColor: Color(0xFF151515),
            leading: false),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(color: Color(0xFF151515)),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Title
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Text(
                    "Login",
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
                  padding: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: Text(
                    "To use our features you must be login first",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // Image
                const Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: Image(image: AssetImage('assets/login/asset1.png')),
                ),

                // Email Textfield
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                      width: 388,
                      height: 61,
                      child: MyTextField(
                        text: 'Email',
                        hide: false,
                        myController: loginController.emailController,
                        myFocusNode: loginController.emailFocusNode,
                      )),
                ),

                // Password Textfield
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                      width: 388,
                      height: 61,
                      child: MyTextField(
                        text: 'Password',
                        hide: true,
                        myController: loginController.passwordController,
                        myFocusNode: loginController.passwordFocusNode,
                      )),
                ),

                // Login Button
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: 388,
                    height: 43,
                    child: MyButton(
                        text: 'Login',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            LoginController.instance.loginUser(
                                loginController.emailController.text.trim(),
                                loginController.passwordController.text.trim());
                          }
                        }),
                  ),
                ),

                // Register Text
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    "Dont Have an Account?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // Register Link
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Signup()));
                  },
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.josefinSans(
                      color: const Color(0xFFF07A00),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
