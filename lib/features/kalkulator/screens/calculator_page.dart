import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/kalkulator/controllers/calculator_controller.dart';
import 'package:overshare2/properties/calculatorbutton.dart';
import 'package:overshare2/properties/appbars.dart';

class CalculatorPage extends StatelessWidget {
  final CalculatorController calculatorController = Get.find();
  CalculatorPage({super.key});

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
                    //calculator display
                    Obx(
                      () => Text(
                        calculatorController.userInput.value,
                        style: GoogleFonts.josefinSans(
                            color: const Color(0xFFFD6500), fontSize: 54.56),
                      ),
                    ),

                    Obx(
                      () => Text(
                        calculatorController.result.value,
                        style: GoogleFonts.josefinSans(
                            color: const Color(0xFF565353), fontSize: 35.33),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
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
                        const Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalculatorButton(
                                text: 'C',
                                backgroundColor: const Color(0xFF830404),
                                textColor: Colors.white,
                                onPressed: () {
                                  calculatorController.input('C');
                                },
                              ),
                              CalculatorButton(
                                icons: Icons.backspace_outlined,
                                useIcon: true,
                                text: '',
                                backgroundColor: const Color(0xFFB4B1B1),
                                textColor: Colors.white,
                                onPressed: () {
                                  calculatorController.input('backspace');
                                },
                              ),
                              CalculatorButton(
                                text: '%',
                                backgroundColor: const Color(0xFFB4B1B1),
                                textColor: Colors.black,
                                onPressed: () {
                                  calculatorController.input('%');
                                },
                              ),
                              CalculatorButton(
                                text: '/',
                                backgroundColor: const Color(0xFFFD6500),
                                textColor: Colors.white,
                                onPressed: () {
                                  calculatorController.input('/');
                                },
                              ),
                            ],
                          ),
                        ),
                        // Baris kedua
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 12.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalculatorButton(
                                text: '1',
                                backgroundColor: const Color(0xFF303030),
                                textColor: Colors.white,
                                onPressed: () {
                                  calculatorController.input('1');
                                },
                              ),
                              CalculatorButton(
                                text: '2',
                                backgroundColor: const Color(0xFF303030),
                                textColor: Colors.white,
                                onPressed: () {
                                  calculatorController.input('2');
                                },
                              ),
                              CalculatorButton(
                                text: '3',
                                backgroundColor: const Color(0xFF303030),
                                textColor: Colors.white,
                                onPressed: () {
                                  calculatorController.input('3');
                                },
                              ),
                              CalculatorButton(
                                text: 'X',
                                backgroundColor: const Color(0xFFFD6500),
                                textColor: Colors.white,
                                onPressed: () {
                                  calculatorController.input('*');
                                },
                              ),
                            ],
                          ),
                        ),
                        // Baris Ketiga
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 12.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalculatorButton(
                                text: '4',
                                backgroundColor: const Color(0xFF303030),
                                textColor: Colors.white,
                                onPressed: () {
                                  calculatorController.input('4');
                                },
                              ),
                              CalculatorButton(
                                text: '5',
                                backgroundColor: const Color(0xFF303030),
                                textColor: Colors.white,
                                onPressed: () {
                                  calculatorController.input('5');
                                },
                              ),
                              CalculatorButton(
                                text: '6',
                                backgroundColor: const Color(0xFF303030),
                                textColor: Colors.white,
                                onPressed: () {
                                  calculatorController.input('6');
                                },
                              ),
                              CalculatorButton(
                                text: '−',
                                backgroundColor: const Color(0xFFFD6500),
                                textColor: Colors.white,
                                onPressed: () {
                                  calculatorController.input('-');
                                },
                              ),
                            ],
                          ),
                        ),
                        // Baris Keempat
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 12.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalculatorButton(
                                text: '7',
                                backgroundColor: const Color(0xFF303030),
                                textColor: Colors.white,
                                onPressed: () {
                                  calculatorController.input('7');
                                },
                              ),
                              CalculatorButton(
                                text: '8',
                                backgroundColor: const Color(0xFF303030),
                                textColor: Colors.white,
                                onPressed: () {
                                  calculatorController.input('8');
                                },
                              ),
                              CalculatorButton(
                                text: '9',
                                backgroundColor: const Color(0xFF303030),
                                textColor: Colors.white,
                                onPressed: () {
                                  calculatorController.input('9');
                                },
                              ),
                              CalculatorButton(
                                text: '+',
                                backgroundColor: const Color(0xFFFD6500),
                                textColor: Colors.white,
                                onPressed: () {
                                  calculatorController.input('+');
                                },
                              ),
                            ],
                          ),
                        ),
                        // Baris Kelima
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 12.0,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalculatorButton(
                                text: '0',
                                backgroundColor: const Color(0xFF303030),
                                textColor: Colors.white,
                                flex: true,
                                onPressed: () {
                                  calculatorController.input('0');
                                },
                              ),
                              CalculatorButton(
                                text: '.',
                                backgroundColor: const Color(0xFF303030),
                                textColor: Colors.white,
                                onPressed: () {
                                  calculatorController.input('.');
                                },
                              ),
                              CalculatorButton(
                                text: '=',
                                backgroundColor: const Color(0xFFFFBB00),
                                textColor: Colors.white,
                                onPressed: () {
                                  calculatorController.input('=');
                                },
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
