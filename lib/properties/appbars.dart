import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  final Color backgroundColor;

  const MyAppBar({required this.backgroundColor, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(right: 55.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/minilogo.png'),
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 2),
              child: Text(
                "OverShare",
                style: GoogleFonts.josefinSans(
                    textStyle: const TextStyle(
                        fontSize: 13.77,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
