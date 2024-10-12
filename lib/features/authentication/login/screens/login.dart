import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/authentication/login/controllers/login_controller.dart';
import 'package:overshare2/properties/appbars.dart';
import 'package:overshare2/properties/button.dart';
import 'package:overshare2/properties/text_form_field.dart';
import 'package:overshare2/features/authentication/signup/screens/signup.dart';
import 'package:overshare2/repositories/authentication/authentication_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();
    final AuthenticationRepository authenticationRepository = Get.find();
    final loginFormKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFF151515),
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: MyAppBar(
              withLeading: true,
              backgroundColor: Color(0xFF151515),
              leading: true),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(color: Color(0xFF151515)),
                child: Form(
                  key: loginFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Title
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
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
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
                        child:
                            Image(image: AssetImage('assets/login/asset1.png')),
                      ),

                      // Email Textfield
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 388, maxHeight: 61),
                          child: MyTextFormField(
                            focusNode: loginController.emailFocusNode,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email cannot be empty';
                              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            text: 'Email',
                            hide: false,
                            myController: loginController.emailController,
                          ),
                        ),
                      ),

                      // Password Textfield
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                            constraints: const BoxConstraints(
                                maxWidth: 388, maxHeight: 61),
                            child: MyTextFormField(
                              focusNode: loginController.passwordFocusNode,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password cannot be empty';
                                }
                                return null;
                              },
                              text: 'Password',
                              hide: true,
                              myController: loginController.passwordController,
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
                                if (loginFormKey.currentState!.validate()) {
                                  loginController.loginUser(
                                      loginController.emailController.text
                                          .trim(),
                                      loginController.passwordController.text
                                          .trim());
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
                          Get.to(const Signup());
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
            Obx(() {
              if (authenticationRepository.isLoading.value) {
                return Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            })
          ],
        ),
      ),
    );
  }
}
