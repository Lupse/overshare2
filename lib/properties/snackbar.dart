import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestSnackBar extends StatelessWidget {
  const TestSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      clipBehavior: Clip.none,
                      padding: const EdgeInsets.all(0),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: _successSnackBar(context),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('Test Success Snackbar')),
            TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      clipBehavior: Clip.none,
                      padding: const EdgeInsets.all(0),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: _errorSnackBar(context),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('Test Warning Snackbar')),
          ],
        ),
      ),
    );
  }

  Widget _successSnackBar(BuildContext context) {
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
                          'Welcome!',
                          style: GoogleFonts.josefinSans(
                              fontSize: 34.35, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Hello, there! It’s good to see you here with us!',
                          style: GoogleFonts.josefinSans(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.white,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _errorSnackBar(BuildContext context) {
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
                          'Oops!',
                          style: GoogleFonts.josefinSans(
                              fontSize: 34.35, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'I think there some mistake on your email or password',
                          style: GoogleFonts.josefinSans(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.white,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
