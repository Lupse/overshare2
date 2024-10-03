import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/authentication/signup/controllers/signup_controller.dart';
import 'package:overshare2/features/authentication/signup/models/signup_model.dart';
import 'package:overshare2/properties/appbars.dart';
import 'package:overshare2/properties/button.dart';
import 'package:overshare2/properties/phonetextfield.dart';
import 'package:overshare2/properties/text_form_field.dart';
import 'package:overshare2/features/authentication/login/screens/login.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final signupFormKey = GlobalKey<FormState>();
    final signUpController = Get.put(SignupController());

    return Scaffold(
        backgroundColor: const Color(0xFF151515),
        appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: MyAppBar(
                backgroundColor: Color(0xFF151515),
                leading: false,
                withLeading: false)),
        body: Form(
          key: signupFormKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: 450,
              decoration: const BoxDecoration(color: Color(0xFF151515)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Title
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Text(
                      "Sign Up",
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
                      "Register your account to use our special features",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.josefinSans(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  // Username Textfield
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                        width: 388,
                        height: 61,
                        child: MyTextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Username cannot be empty';
                            }
                            return null;
                          },
                          myController: signUpController.usernameController,
                          text: 'Username',
                          hide: false,
                        )),
                  ),

                  // Email Textfield
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                        width: 388,
                        height: 61,
                        child: MyTextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email cannot be empty';
                            }
                            return null;
                          },
                          myController: signUpController.emailController,
                          text: 'Email',
                          hide: false,
                        )),
                  ),

                  // Phone Textfield
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                        width: 388,
                        height: 61,
                        child: PhoneNumberInput(
                          controller: signUpController.phoneController,
                        )),
                  ),

                  // Password Textfield
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                        width: 388,
                        height: 61,
                        child: MyTextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password cannot be empty';
                            }
                            return null;
                          },
                          myController: signUpController.passwordController,
                          text: 'Password',
                          hide: true,
                        )),
                  ),

                  // Confirm Password Textfield
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                        width: 388,
                        height: 61,
                        child: MyTextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password cannot be empty';
                            } else if (value !=
                                signUpController.passwordController.text) {
                              return 'Password does not match';
                            }
                            return null;
                          },
                          text: 'Confirm Password',
                          hide: true,
                          myController:
                              signUpController.confirmPasswordController,
                        )),
                  ),

                  // SignUp Button
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: SizedBox(
                        width: 388,
                        height: 43,
                        child: MyButton(
                            text: 'Sign Up',
                            onPressed: () {
                              if (signupFormKey.currentState!.validate()) {
                                //signup data
                                final user = SignupModel(
                                    username: signUpController
                                        .usernameController.text
                                        .trim(),
                                    phone: signUpController.phoneController.text
                                        .trim(),
                                    email: signUpController.emailController.text
                                        .trim(),
                                    password: signUpController
                                        .passwordController.text
                                        .trim());
                                signUpController.signupUserData(user);

                                //signup auth
                                SignupController.instance.signupUserAuth(
                                    signUpController.emailController.text
                                        .trim(),
                                    signUpController.passwordController.text
                                        .trim());
                              }
                            })),
                  ),

                  // Redirect to login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 17.0, right: 8),
                        child: Text(
                          "Already Have an Account?",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.josefinSans(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: Text(
                            'Log In',
                            style: GoogleFonts.josefinSans(
                              color: const Color(0xFFF07A00),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
