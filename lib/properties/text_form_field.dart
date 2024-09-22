import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFormField extends StatelessWidget {
  final String text;
  final bool hide;
  final TextEditingController? myController;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  const MyTextFormField({
    super.key,
    required this.text,
    required this.hide,
    this.myController,
    this.validator,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 388,
      height: 61,
      child: TextFormField(
        focusNode: focusNode,
        validator: validator,
        controller: myController,
        cursorColor: const Color.fromARGB(255, 69, 69, 69),
        style: const TextStyle(color: Colors.white),
        obscureText: hide,
        decoration: InputDecoration(
          hintStyle: GoogleFonts.josefinSans(
            color: const Color.fromARGB(117, 255, 255, 255),
          ),
          hintText: text,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(9)),
            borderSide: BorderSide(color: Color(0xFFD45101)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(9)),
            borderSide: BorderSide(color: Color(0xFFD45101)),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(9)),
            borderSide: BorderSide(color: Color(0xFFD45101)),
          ),
        ),
      ),
    );
  }
}
