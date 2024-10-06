import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';

class Snackbar extends GetxController {
  //success snackbar
  Widget successSnackbar(String title, String message) {
    return SizedBox(
      width: 388,
      height: 98,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/props/success_snapbar.png'),
            fit: BoxFit.fill, // Fit the image to cover the entire container
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Color(0xFF238300),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Positioned(
              left: 30,
              top: -20,
              child: SizedBox(
                  width: 46.91,
                  height: 48.74,
                  child: Image(image: AssetImage('assets/props/star.png'))),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 97,
                ),
                SizedBox(
                  width: 235,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.josefinSans(
                              fontSize: 34.35, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          message,
                          style: GoogleFonts.josefinSans(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  //error snackbar
  Widget errorSnackbar(String title, String message) {
    return SizedBox(
      width: 388,
      height: 98,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/props/error_snapbar.png'),
            fit: BoxFit.fill, // Fit the image to cover the entire container
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Color(0xFF238300),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Positioned(
              left: 30,
              top: -20,
              child: SizedBox(
                  width: 46.91,
                  height: 48.74,
                  child: Image(image: AssetImage('assets/props/error.png'))),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 97,
                ),
                SizedBox(
                  width: 235,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.josefinSans(
                              fontSize: 34.35, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          message,
                          style: GoogleFonts.josefinSans(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
