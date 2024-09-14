import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberInput extends StatefulWidget {
  final Function(PhoneNumber)? onInputChanged;
  final Function(bool)? onInputValidated;
  final Function(PhoneNumber)? onSaved;
  final TextEditingController? controller;

  const PhoneNumberInput({
    super.key,
    this.onInputChanged,
    this.onInputValidated,
    this.onSaved,
    this.controller,
  });

  @override
  PhoneNumberInputState createState() => PhoneNumberInputState();
}

class PhoneNumberInputState extends State<PhoneNumberInput> {
  String initialCountry = 'ID';
  PhoneNumber number = PhoneNumber(isoCode: 'ID');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFD45101)),
          borderRadius: BorderRadius.circular(9)),
      child: InternationalPhoneNumberInput(
        selectorTextStyle: GoogleFonts.josefinSans(color: Colors.white),
        spaceBetweenSelectorAndTextField: 0,
        textStyle: const TextStyle(color: Colors.white),
        inputDecoration: const InputDecoration(
          hintText: 'Phone Number',
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintStyle: TextStyle(color: Color.fromARGB(117, 255, 255, 255)),
        ),
        onInputChanged: widget.onInputChanged,
        onInputValidated: widget.onInputValidated,
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
        ignoreBlank: true,
        autoValidateMode: AutovalidateMode.disabled,
        initialValue: number,
        textFieldController: widget.controller,
        formatInput: false,
        keyboardType:
            const TextInputType.numberWithOptions(signed: true, decimal: true),
        cursorColor: const Color.fromARGB(255, 69, 69, 69),
        onSaved: widget.onSaved,
      ),
    );
  }
}
