import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final bool flex;
  final bool useIcon;
  final IconData? icons;
  const CalculatorButton(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      this.flex = false,
      this.useIcon = false,
      this.icons,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return flex
        ? SizedBox(
            width: 172,
            height: 80,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(backgroundColor)),
                onPressed: () {},
                child: useIcon
                    ? Icon(
                        icons,
                        color: Colors.black,
                      )
                    : Text(
                        text,
                        style: GoogleFonts.josefinSans(
                            color: textColor,
                            fontSize: 31,
                            fontWeight: FontWeight.bold),
                      )),
          )
        : SizedBox(
            width: 80,
            height: 80,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(backgroundColor)),
                onPressed: () {},
                child: useIcon
                    ? Icon(
                        icons,
                        color: Colors.black,
                      )
                    : Text(
                        text,
                        style: GoogleFonts.josefinSans(
                            color: textColor,
                            fontSize: 31,
                            fontWeight: FontWeight.bold),
                      )),
          );
  }
}
