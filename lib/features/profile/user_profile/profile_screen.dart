import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/profile/user_profile/controllers/user_profile_controller.dart';
import 'package:overshare2/properties/appbars.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 120, height: 120, child: CircleAvatar()),
            Obx(() {
              if (profileController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (profileController.profile.value != null) {
                return Column(
                  children: [
                    Text(
                      'Username: ${profileController.profile.value!.username}',
                      style: GoogleFonts.josefinSans(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Password: ${profileController.profile.value!.password}',
                      style: GoogleFonts.josefinSans(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Phone Number: ${profileController.profile.value!.phoneNumber}',
                      style: GoogleFonts.josefinSans(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Gmail: ${profileController.profile.value!.email}',
                      style: GoogleFonts.josefinSans(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                );
              } else {
                return const Text('User not found');
              }
            })
          ],
        ),
      ),
    );
  }
}
