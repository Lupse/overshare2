import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/repositories/authentication/authentication_repository.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 28, right: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                Text(
                  'About Overshare',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.josefinSans(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Overshare provide you with variant features that help user to do all their activities within this app:',
              textAlign: TextAlign.justify,
              style: GoogleFonts.josefinSans(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Newest Update (1.1.2) :',
              style: GoogleFonts.josefinSans(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '1. Stopwatch\nClick "Try it now!" to access stopwatch features. To start the time click "start" button in the middle also you can track the record by click the "mark" button on the right. To restart the timer, you can click the "restart" button on the left.',
              textAlign: TextAlign.justify,
              style: GoogleFonts.josefinSans(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '2. Favorites\nThis features allows user to add their favorite news media. So, they can find it easily in the future.',
              textAlign: TextAlign.justify,
              style: GoogleFonts.josefinSans(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Current Version: 1.1.2',
                      style: GoogleFonts.josefinSans(
                        color: const Color.fromARGB(59, 255, 255, 255),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Last Update : October 12th 2024',
                      style: GoogleFonts.josefinSans(
                        color: const Color.fromARGB(59, 255, 255, 255),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Developer Overshare Group',
                      style: GoogleFonts.josefinSans(
                        color: const Color.fromARGB(59, 255, 255, 255),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Logout Button
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
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
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
