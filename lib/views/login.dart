import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/properties/appbars.dart';
import 'package:overshare2/properties/button.dart';
import 'package:overshare2/properties/textfield.dart';
import 'package:overshare2/views/signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: MyAppBar(
          backgroundColor: Color(0xFF151515),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 75,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(color: Color(0xFF151515)),
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
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                      width: 388,
                      height: 61,
                      child: MyTextField(
                        text: 'Email',
                        hide: false,
                      )),
                ),

                // Password Textfield
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                      width: 388,
                      height: 61,
                      child: MyTextField(
                        text: 'Password',
                        hide: true,
                      )),
                ),

                // Login Button
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: 388,
                    height: 43,
                    child: MyButton(text: 'Login', onPressed: () {}),
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
