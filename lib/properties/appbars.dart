import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/profile/user_profile/profile_scree.dart';

class MyAppBar extends StatelessWidget {
  final Color backgroundColor;
  final bool leading;
  final bool withLeading;

  const MyAppBar({
    required this.backgroundColor,
    super.key,
    required this.leading,
    required this.withLeading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      title: Row(
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
          withLeading
              ? const SizedBox(
                  width: 55,
                )
              : const SizedBox()
        ],
      ),
      backgroundColor: backgroundColor,
    );
  }
}
