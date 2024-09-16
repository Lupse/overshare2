import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/authentication/login/screens/login.dart';

//Expanded cannot be used inside a Stack.
// You should use Expanded only within a Column, Row or Flex

// First Rule: use Expanded only within a column, row or flex.
// Second Rule: Parent column that have expanded child column must be wrapped with expanded as well

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            const Expanded(
                child:
                    Image(image: AssetImage("assets/landing/landingbg.png"))),
            Expanded(child: Container())
          ],
        ),
        Positioned.fill(
            child: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 207, 81, 2),
              backgroundBlendMode: BlendMode.colorBurn),
        )),
        Padding(
          padding: const EdgeInsets.only(top: 350.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0xFF151515),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60))),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome!",
                    style: GoogleFonts.josefinSans(
                        textStyle: const TextStyle(
                            fontSize: 34.35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                        "Find the easiest and most simple way to count all your problem",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.josefinSans(
                            textStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ))),
                  ),
                  const Image(image: AssetImage('assets/landing/asset1.png')),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: SizedBox(
                      width: 326,
                      height: 43,
                      child: TextButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xFFF76D00))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: Text(
                            "Get Started",
                            style: GoogleFonts.josefinSans(
                                textStyle: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
