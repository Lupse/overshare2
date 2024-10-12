import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/profile/user_profile/controllers/user_profile_controller.dart';
import 'package:overshare2/properties/appbars.dart';
import 'package:overshare2/properties/button.dart';
import 'package:overshare2/properties/text_form_field.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    var screenWidth = MediaQuery.of(context).size.width;

    // Fetch the user profile based on the logged-in user's email
    profileController.fetchUserProfileByEmail();

    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: MyAppBar(
            withLeading: true,
            backgroundColor: Color(0xFF151515),
            leading: true,
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 1000,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 28.0),
                          // Title
                          child: Text(
                            'My Profile',
                            style: GoogleFonts.josefinSans(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),

                        // Avatar
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Stack(children: [
                            const SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: CircleAvatar(),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit),
                                style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color(0XFFF87300))),
                                color: Colors.white,
                              ),
                            )
                          ]),
                        ),

                        // Profile
                        Obx(() {
                          if (profileController.isLoading.value) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (profileController.profile.value != null) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: SizedBox(
                                height: 350,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 28.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      MyTextFormField(
                                          text: '',
                                          initialValue: profileController
                                              .profile.value!.username,
                                          hide: false),
                                      MyTextFormField(
                                          text: '',
                                          initialValue: profileController
                                              .profile.value!.email,
                                          hide: false),
                                      MyTextFormField(
                                          text: '',
                                          initialValue: profileController
                                              .profile.value!.phoneNumber,
                                          hide: false),
                                      SizedBox(
                                          width: double.infinity,
                                          child: MyButton(
                                              text: 'Save', onPressed: () {}))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const Text('User not found');
                          }
                        }),
                      ],
                    ),

                    // Footer Image
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        width: screenWidth,
                        child: const Image(
                            image: AssetImage('assets/aboutus/asset1.png')),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
