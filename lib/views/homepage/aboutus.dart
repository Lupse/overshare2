import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/properties/appbars.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: MyAppBar(
            withLeading: true,
            backgroundColor: Color(0xFF151515),
            leading: true,
          )),
      backgroundColor: const Color(0xFF151515),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _luthfiProfile(),
            _dejanProfile(),
            const Image(image: AssetImage('assets/aboutus/asset1.png'))
          ],
        ),
      ),
    );
  }

  Widget _luthfiProfile() {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
      child: Row(
        children: [
          SizedBox(
            width: 142,
            height: 142,
            child: Stack(children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/aboutus/luthfi.jpg'),
                        fit: BoxFit.cover),
                    color: Color(0xFF6D6D6D),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(100, 80),
                        bottomRight: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25))),
              ),
              Positioned(
                top: -10,
                child: SizedBox(
                  width: 68,
                  height: 68,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFF151515), shape: BoxShape.circle),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child:
                          Image(image: AssetImage('assets/aboutus/Star.png')),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Column(
            children: [
              SizedBox(
                width: 206,
                height: 80,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      gradient: LinearGradient(
                          colors: [Color(0xFF151515), Color(0xFF282828)])),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Luthfi Ardinata F.',
                          style: GoogleFonts.josefinSans(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        Text(
                          '124220140',
                          style: GoogleFonts.josefinSans(
                            fontSize: 12,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: SizedBox(
                            width: 59,
                            height: 15,
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Color(0xFF616161)),
                              child: Center(
                                child: Text(
                                  'Frontend',
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 9.5,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 206,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Text(
                    '"Dejan kemarin belum sesipit ini sebelum mengenal mobile"',
                    style: GoogleFonts.josefinSans(
                      fontSize: 12,
                      color: const Color.fromARGB(88, 255, 255, 255),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _dejanProfile() {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
      child: Row(
        children: [
          SizedBox(
            width: 142,
            height: 142,
            child: Stack(children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/aboutus/dejan.jpeg'),
                        fit: BoxFit.cover),
                    color: Color(0xFF6D6D6D),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(100, 80),
                        bottomRight: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25))),
              ),
              Positioned(
                top: -10,
                child: SizedBox(
                  width: 68,
                  height: 68,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFF151515), shape: BoxShape.circle),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child:
                          Image(image: AssetImage('assets/aboutus/Star.png')),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Column(
            children: [
              SizedBox(
                width: 206,
                height: 80,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      gradient: LinearGradient(
                          colors: [Color(0xFF151515), Color(0xFF282828)])),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dejan Azul Ultamar',
                          style: GoogleFonts.josefinSans(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        Text(
                          '124220138',
                          style: GoogleFonts.josefinSans(
                            fontSize: 12,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: SizedBox(
                            width: 59,
                            height: 15,
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Color(0xFF616161)),
                              child: Center(
                                child: Text(
                                  'Backend',
                                  style: GoogleFonts.josefinSans(
                                    fontSize: 9.5,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 206,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Text(
                    '"Mungkin aku memang sipit, tapi aplikasiku tidak seipit"',
                    style: GoogleFonts.josefinSans(
                      fontSize: 12,
                      color: const Color.fromARGB(88, 255, 255, 255),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
