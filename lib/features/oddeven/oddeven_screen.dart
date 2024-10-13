import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/properties/appbars.dart';

class OddevenScreen extends StatefulWidget {
  const OddevenScreen({super.key});

  @override
  State<OddevenScreen> createState() => _OddevenScreenState();
}

class _OddevenScreenState extends State<OddevenScreen> {
  TextEditingController input = TextEditingController();
  int angka = 0;
  String text = '';
  bool odd = false;
  bool even = false;

  void check() {
    setState(() {
      angka = int.tryParse(input.text) ?? 0;
      if (angka > 0) {
        if (angka % 2 == 0) {
          odd = true;
          even = false;
          text = '';
        } else {
          even = true;
          odd = false;
          text = '';
        }
      } else if (angka < 0) {
        if (angka % -2 == 0) {
          odd = true;
          even = false;
          text = '';
        } else {
          even = true;
          odd = false;
          text = '';
        }
      } else {
        odd = false;
        even = false;
        text = 'Masukkan angka terlebih dahulu!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: MyAppBar(
            withLeading: true,
            backgroundColor: Color(0xFF151515),
            leading: true,
          )),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Text(
                'Odd/Even',
                style: GoogleFonts.josefinSans(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'Determine each number either it’s odd or even',
                style: GoogleFonts.josefinSans(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 80),
              Text(
                'Your Number :',
                style: GoogleFonts.josefinSans(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),

              // Input Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: TextField(
                  onEditingComplete: () {
                    check();
                  },
                  controller: input,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(focusColor: Colors.white),
                ),
              ),

              const SizedBox(height: 10),

              // Error Handling
              Text(
                text,
                style: GoogleFonts.josefinSans(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),

              const SizedBox(height: 50),
              // Result
              Text(
                'The Result :',
                style: GoogleFonts.josefinSans(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Odd Circle
                    AnimatedContainer(
                      width: odd ? 200 : 126,
                      height: odd ? 200 : 126,
                      duration: const Duration(seconds: 1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: odd
                            ? const Color(0xFF007808)
                            : const Color(0xff303030),
                      ),
                      child: Center(
                        child: Text(
                          'Odd',
                          style: GoogleFonts.josefinSans(
                              color: Colors.white,
                              fontSize: 29,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Even Circle
                    AnimatedContainer(
                      width: even ? 200 : 126,
                      height: even ? 200 : 126,
                      duration: const Duration(seconds: 1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: even
                            ? const Color(0xFF007808)
                            : const Color(0xff303030),
                      ),
                      child: Center(
                        child: Text(
                          'Even',
                          style: GoogleFonts.josefinSans(
                              color: Colors.white,
                              fontSize: 29,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
