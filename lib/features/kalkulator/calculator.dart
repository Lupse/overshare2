import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/kalkulator/calculatorbutton.dart';
import 'package:overshare2/properties/appbars.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

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
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '8,953 x 3',
                      style: GoogleFonts.josefinSans(
                          color: const Color(0xFFFD6500), fontSize: 54.56),
                    ),
                    Text(
                      '26,859',
                      style: GoogleFonts.josefinSans(
                          color: const Color(0xFF565353), fontSize: 35.33),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 12.0),
                          child: Icon(
                            Icons.history,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        Icon(
                          Icons.compare_arrows_sharp,
                          color: Colors.white,
                          size: 25,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: Divider(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalculatorButton(
                                text: 'C',
                                backgroundColor: Color(0xFF830404),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                icons: Icons.backspace_outlined,
                                useIcon: true,
                                text: '',
                                backgroundColor: Color(0xFFB4B1B1),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '%',
                                backgroundColor: Color(0xFFB4B1B1),
                                textColor: Colors.black,
                              ),
                              CalculatorButton(
                                text: '/',
                                backgroundColor: Color(0xFFFD6500),
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        // Baris kedua
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 12.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalculatorButton(
                                text: '1',
                                backgroundColor: Color(0xFF303030),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '2',
                                backgroundColor: Color(0xFF303030),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '3',
                                backgroundColor: Color(0xFF303030),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: 'X',
                                backgroundColor: Color(0xFFFD6500),
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        // Baris Ketiga
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 12.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalculatorButton(
                                text: '4',
                                backgroundColor: Color(0xFF303030),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '5',
                                backgroundColor: Color(0xFF303030),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '6',
                                backgroundColor: Color(0xFF303030),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '−',
                                backgroundColor: Color(0xFFFD6500),
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        // Baris Keempat
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 12.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalculatorButton(
                                text: '7',
                                backgroundColor: Color(0xFF303030),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '8',
                                backgroundColor: Color(0xFF303030),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '9',
                                backgroundColor: Color(0xFF303030),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '+',
                                backgroundColor: Color(0xFFFD6500),
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        // Baris Kelima
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 12.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalculatorButton(
                                text: '0',
                                backgroundColor: Color(0xFF303030),
                                textColor: Colors.white,
                                flex: true,
                              ),
                              CalculatorButton(
                                text: '.',
                                backgroundColor: Color(0xFF303030),
                                textColor: Colors.white,
                              ),
                              CalculatorButton(
                                text: '=',
                                backgroundColor: Color(0xFFFFBB00),
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
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
