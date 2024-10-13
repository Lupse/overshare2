import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/properties/appbars.dart';
import 'package:overshare2/properties/button.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: MyAppBar(
            withLeading: true,
            backgroundColor: Color(0xFF151515),
            leading: true,
          )),
      body: Column(
        children: [
          // Header (Image & Logo)
          Stack(
            children: [
              // Background Image
              const SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: Image(image: AssetImage('assets/login/asset1.png'))),

              // Background Color Layer
              Container(
                height: 200,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(30, 21, 21, 21),
                  Color.fromARGB(210, 21, 21, 21),
                  Color(0xFF151515),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              ),

              // Logo
              Positioned(
                left: 0.4 * screenWidth,
                bottom: 0,
                child: const SizedBox(
                    width: 80,
                    height: 80,
                    child: Image(image: AssetImage('assets/minilogo.png'))),
              )
            ],
          ),

          // Title
          Padding(
            padding: const EdgeInsets.only(top: 14.0, left: 12, right: 12),
            child: Text(
              'Meledaknya twin tower oleh islam pada 9/11 ',
              textAlign: TextAlign.center,
              style: GoogleFonts.josefinSans(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),

          // Date
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Text(
              '9/11 Dhuarr islam mengebom segalanya',
              textAlign: TextAlign.center,
              style: GoogleFonts.josefinSans(
                  fontSize: 14,
                  color: const Color.fromARGB(85, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ),
          ),

          // Writer
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Text(
              'Ditulis oleh OperatorLupsehh',
              textAlign: TextAlign.center,
              style: GoogleFonts.josefinSans(
                  fontSize: 14,
                  color: const Color.fromARGB(85, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ),
          ),

          // Descriptiion
          Padding(
            padding: const EdgeInsets.only(top: 42.0, left: 12, right: 12),
            child: Text(
              'Serangan 11 September 2001 (9/11) adalah aksi terorisme paling mematikan dalam sejarah AS, ketika 19 anggota al-Qaeda membajak empat pesawat dan menabrakkan dua di antaranya ke Menara Kembar World Trade Center di New York, satu ke Pentagon, dan satu lagi jatuh di Pennsylvania setelah penumpang melawan pembajak. Peristiwa ini menewaskan hampir 3.000 orang dan memicu "Perang Melawan Teror" yang mencakup invasi AS ke Afghanistan untuk menggulingkan Taliban. Serangan 9/11 membawa perubahan besar dalam kebijakan keamanan global dan berdampak luas dalam politik dan kebijakan luar negeri AS.',
              textAlign: TextAlign.justify,
              style: GoogleFonts.josefinSans(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ),
          ),

          // Button
          Padding(
            padding: const EdgeInsets.only(top: 42.0),
            child: SizedBox(
                width: 300,
                height: 40,
                child: MyButton(text: 'Read More', onPressed: () {})),
          )
        ],
      ),
    );
  }
}
