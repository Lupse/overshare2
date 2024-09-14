import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text; // Teks pada tombol
  final VoidCallback onPressed; // Aksi saat tombol ditekan

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: const ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(15.5),
                    right: Radius.circular(15.5)))),
            backgroundColor: WidgetStatePropertyAll(Color(0xFFF76D00))),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.josefinSans(
              textStyle: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
        ));
  }
}
