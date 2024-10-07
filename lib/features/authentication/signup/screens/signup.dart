import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:overshare2/features/authentication/signup/controllers/phone_number_controller.dart';
import 'package:overshare2/features/authentication/signup/controllers/signup_controller.dart';
import 'package:overshare2/properties/appbars.dart';
import 'package:overshare2/properties/button.dart';
import 'package:overshare2/properties/phonetextfield.dart';
import 'package:overshare2/properties/text_form_field.dart';
import 'package:overshare2/features/authentication/login/screens/login.dart';
import 'package:overshare2/repositories/authentication/authentication_repository.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final signupFormKey = GlobalKey<FormState>();
    final signUpControllerInstance = Get.find<SignupController>();
    final phoneNumberControllerInstance = Get.find<PhoneNumberController>();
    final AuthenticationRepository authenticationRepository = Get.find();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: const Color(0xFF151515),
          appBar: const PreferredSize(
              preferredSize: Size(double.infinity, 60),
              child: MyAppBar(
                  backgroundColor: Color(0xFF151515),
                  leading: false,
                  withLeading: false)),
          body: Stack(
            children: [
              Form(
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
                                focusNode:
                                    signUpControllerInstance.usernameFocusNode,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Username cannot be empty';
                                  }
                                  return null;
                                },
                                myController:
                                    signUpControllerInstance.usernameController,
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
                                focusNode:
                                    signUpControllerInstance.emailFocusNode,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email cannot be empty';
                                  }
                                  return null;
                                },
                                myController:
                                    signUpControllerInstance.emailController,
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
                                controller: phoneNumberControllerInstance
                                    .phoneNumberController,
                                focusNode: phoneNumberControllerInstance
                                    .phoneNumberFocusNode,
                                onInputChanged: (PhoneNumber number) {
                                  phoneNumberControllerInstance
                                      .setPhoneNumber(number);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Phone number cannot be empty';
                                  }
                                  return null;
                                },
                              )),
                        ),

                        // Password Textfield
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: SizedBox(
                              width: 388,
                              height: 61,
                              child: MyTextFormField(
                                focusNode:
                                    signUpControllerInstance.passwordFocusNode,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password cannot be empty';
                                  }
                                  return null;
                                },
                                myController:
                                    signUpControllerInstance.passwordController,
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
                                focusNode: signUpControllerInstance
                                    .confirmPasswordFocusNode,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password cannot be empty';
                                  } else if (value !=
                                      signUpControllerInstance
                                          .passwordController.text) {
                                    return 'Password does not match';
                                  }
                                  return null;
                                },
                                text: 'Confirm Password',
                                hide: true,
                                myController: signUpControllerInstance
                                    .confirmPasswordController,
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
                                    if (signupFormKey.currentState!
                                        .validate()) {
                                      const Center(
                                          child: CircularProgressIndicator());
                                      //signup auth
                                      SignupController.instance.signupUserAuth(
                                          signUpControllerInstance
                                              .emailController.text
                                              .trim(),
                                          signUpControllerInstance
                                              .passwordController.text
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
                              padding:
                                  const EdgeInsets.only(top: 17.0, right: 8),
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
                                  Get.to(const LoginPage());
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
              ),
              Obx(() {
                if (authenticationRepository.isLoading.value) {
                  return Container(
                      color: Colors.black.withOpacity(0.5),
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      )));
                } else {
                  return const SizedBox.shrink();
                }
              })
            ],
          )),
    );
  }
}
