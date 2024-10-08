import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/kalkulator/screens/calculator_page.dart';
import 'package:overshare2/features/news/screens/news_home.dart';
import 'package:overshare2/features/profile/user_profile/controllers/user_profile_controller.dart';
import 'package:overshare2/features/stopwatch/stopwatch_screen.dart';
import 'package:overshare2/repositories/authentication/authentication_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());

    // Fetch the user profile based on the logged-in user's email
    profileController.fetchUserProfileByEmail();
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(children: [
              // Username & Logout
              Row(
                children: [
                  SizedBox(
                      width: 110,
                      child: Obx(() {
                        if (profileController.isLoading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (profileController.profile.value != null) {
                          return Text(
                            'Hello, ${profileController.profile.value!.username}',
                            style: GoogleFonts.josefinSans(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          );
                        } else {
                          return const Text('User not found');
                        }
                      })),
                  const Expanded(
                    child: Divider(
                      indent: 12,
                      endIndent: 42,
                    ),
                  ),
                  TextButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Color(0xFFA50000))),
                    onPressed: () {
                      AuthenticationRepository.instance.logoutUser();
                    },
                    child: Text(
                      "Logout",
                      style: GoogleFonts.josefinSans(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),

              // 2 card
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Card 1
                    Stack(children: [
                      SizedBox(
                        width: 164,
                        height: 218,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 173,
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF151515),
                                          Color.fromARGB(210, 21, 21, 21),
                                          Color.fromARGB(140, 255, 89, 0)
                                        ],
                                        begin: Alignment.bottomRight,
                                        end: Alignment.topLeft),
                                    border: Border(),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight:
                                            Radius.elliptical(60, 30))),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Simple Calculator',
                                        style: GoogleFonts.josefinSans(
                                            fontSize: 23,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Solve any simple mathematic operation",
                                        style: GoogleFonts.josefinSans(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 7,
                                        endIndent: 90,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFFF07A00)),
                          child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                Get.to(const CalculatorPage());
                              },
                              icon: const Icon(Icons.arrow_forward)),
                        ),
                      ),
                    ]),

                    // Card 2
                    TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            WidgetStateProperty.all(Colors.transparent),
                        splashFactory: NoSplash.splashFactory,
                      ),
                      onPressed: () {},
                      child: SizedBox(
                        width: 164,
                        height: 218,
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 0.5, color: Colors.white54),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Odd/Even',
                                style: GoogleFonts.josefinSans(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Divider(
                                thickness: 0.2,
                                endIndent: 20,
                                indent: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  "Determine each number either it’s odd or even",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 140,
                                child: Image(
                                    image: AssetImage(
                                  'assets/homepage/asset1.png',
                                )),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: SizedBox(
                  width: 350,
                  height: 152,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.white54),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'News',
                            style: GoogleFonts.josefinSans(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "See detail information about the developer of the Overshare App",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.josefinSans(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                              width: double.infinity,
                              height: 32,
                              child: TextButton(
                                  style: const ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left:
                                                          Radius.circular(15.5),
                                                      right: Radius.circular(
                                                          15.5)))),
                                      backgroundColor: WidgetStatePropertyAll(
                                          Color(0xFFF76D00))),
                                  onPressed: () {
                                    Get.to(const NewsHome());
                                  },
                                  child: Text(
                                    'See Whats Happening',
                                    style: GoogleFonts.josefinSans(
                                        textStyle: const TextStyle(
                                            fontSize: 12, color: Colors.white)),
                                  )))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: SizedBox(
                  width: 350,
                  height: 152,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.white54),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Stopwatch',
                            style: GoogleFonts.josefinSans(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "See detail information about the developer of the Overshare App",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.josefinSans(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                              width: double.infinity,
                              height: 32,
                              child: TextButton(
                                  style: const ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left:
                                                          Radius.circular(15.5),
                                                      right: Radius.circular(
                                                          15.5)))),
                                      backgroundColor: WidgetStatePropertyAll(
                                          Color(0xFFF76D00))),
                                  onPressed: () {
                                    Get.to(const StopwatchScreen());
                                  },
                                  child: Text(
                                    'Countdown!',
                                    style: GoogleFonts.josefinSans(
                                        textStyle: const TextStyle(
                                            fontSize: 12, color: Colors.white)),
                                  )))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          // Footer Image
          const Image(image: AssetImage('assets/homepage/asset2.png'))
        ],
      ),
    );
  }
}
