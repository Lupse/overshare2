import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/kalkulator/screens/calculator_page.dart';
import 'package:overshare2/features/news/models/news_list.dart';
import 'package:overshare2/features/news/screens/news_home.dart';
import 'package:overshare2/features/profile/user_profile/controllers/user_profile_controller.dart';
import 'package:overshare2/features/stopwatch/stopwatch_screen.dart';
import 'package:overshare2/properties/button.dart';
import 'package:overshare2/repositories/authentication/authentication_repository.dart';
import 'package:overshare2/views/homepage/aboutus.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
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

              // Stopwatch Card
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Stack(children: [
                  SizedBox(
                    width: double.infinity,
                    height: 173,
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
                                    transform: GradientRotation(170.2),
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft),
                                border: Border(),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.elliptical(60, 30))),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tik Tok! Stopwatch',
                                    style: GoogleFonts.josefinSans(
                                        fontSize: 23,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      "Count time for your activities with our incredible and simple stopwatch",
                                      style: GoogleFonts.josefinSans(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 7,
                                    endIndent: 310,
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
                        child: SizedBox(
                            width: 100,
                            height: 32,
                            child: TextButton(
                                style: const ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.horizontal(
                                                    left: Radius.circular(15.5),
                                                    right: Radius.circular(
                                                        15.5)))),
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color(0xFFF76D00))),
                                onPressed: () {
                                  Get.to(const StopwatchScreen());
                                },
                                child: Text(
                                  'Try it now!',
                                  style: GoogleFonts.josefinSans(
                                      textStyle: const TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                )))),
                  ),
                ]),
              ),
            ]),
          ),

          // Favorite News
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    'Your Favorites',
                    style: GoogleFonts.josefinSans(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                  child: Divider(
                    thickness: 0.2,
                  ),
                ),
                // News ListView Builder
                SizedBox(
                  height: 173,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      News berita = newsList[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: SizedBox(
                            width: 133,
                            height: 173,
                            child: Card(
                              child: Stack(children: [
                                // Background
                                Image(image: AssetImage(berita.imageAsset)),
                                Container(
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      gradient: LinearGradient(colors: [
                                        Colors.transparent,
                                        Color(0xff2B2828),
                                        Color(0xff2B2828)
                                      ], transform: GradientRotation(20.5))),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Icon
                                    const Row(
                                      children: [
                                        Spacer(),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Logo
                                    Row(
                                      children: [
                                        const Spacer(),
                                        SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: Image(
                                              image: AssetImage(
                                                  berita.imageAsset)),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),

                                    // Text
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            berita.name,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.josefinSans(
                                                fontSize: 10,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            berita.description,
                                            style: GoogleFonts.josefinSans(
                                              fontSize: 7,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Button
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4),
                                      child: Row(
                                        children: [
                                          const Spacer(),
                                          SizedBox(
                                            width: 55,
                                            height: 15,
                                            child: ElevatedButton(
                                                style: const ButtonStyle(
                                                  padding:
                                                      WidgetStatePropertyAll(
                                                          EdgeInsets.all(3)),
                                                  backgroundColor:
                                                      WidgetStatePropertyAll(
                                                          Color(0xFFF87300)),
                                                  foregroundColor:
                                                      WidgetStatePropertyAll(
                                                          Colors.white),
                                                ),
                                                onPressed: () {},
                                                child: Text(
                                                  'Read Now!',
                                                  style:
                                                      GoogleFonts.josefinSans(
                                                    fontSize: 7,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ]),
                            )),
                      );
                    },
                  ),
                )
              ],
            ),
          ),

          // News Website
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    'News',
                    style: GoogleFonts.josefinSans(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                  child: Divider(
                    thickness: 0.2,
                  ),
                ),
                // News ListView Builder
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    News berita = newsList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4),
                      child: SizedBox(
                        width: 349,
                        height: 175,
                        child: Card(
                          child: Stack(
                            children: [
                              Image(image: AssetImage(berita.imageAsset)),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    gradient: LinearGradient(colors: [
                                      Colors.transparent,
                                      Color(0xff2B2828),
                                      Color(0xff2B2828),
                                    ], transform: GradientRotation(20.5))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Logo
                                    SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: Image(
                                          image: AssetImage(berita.imageAsset)),
                                    ),
                                    // Text
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            berita.name,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.josefinSans(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 2),
                                          SizedBox(
                                            width: 250,
                                            child: Text(
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              berita.description,
                                              style: GoogleFonts.josefinSans(
                                                fontSize: 8,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                        ],
                                      ),
                                    ),
                                    // Button
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0),
                                              child: SizedBox(
                                                height: 25,
                                                child: ElevatedButton(
                                                    style: const ButtonStyle(
                                                      padding:
                                                          WidgetStatePropertyAll(
                                                              EdgeInsets.all(
                                                                  3)),
                                                      backgroundColor:
                                                          WidgetStatePropertyAll(
                                                              Color(
                                                                  0xFFF87300)),
                                                      foregroundColor:
                                                          WidgetStatePropertyAll(
                                                              Colors.white),
                                                    ),
                                                    onPressed: () {},
                                                    child: Text(
                                                      'Read Now!',
                                                      style: GoogleFonts
                                                          .josefinSans(
                                                        fontSize: 7,
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),

          // About Devs
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20),
            child: SizedBox(
              width: 350,
              height: 152,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.white54),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'About Developer',
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
                                          borderRadius: BorderRadius.horizontal(
                                              left: Radius.circular(15.5),
                                              right: Radius.circular(15.5)))),
                                  backgroundColor: WidgetStatePropertyAll(
                                      Color(0xFFF76D00))),
                              onPressed: () {
                                Get.to(const AboutUs());
                              },
                              child: Text(
                                'See the details',
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

          // Footer Image
          const Image(image: AssetImage('assets/homepage/asset2.png'))
        ],
      ),
    );
  }
}
