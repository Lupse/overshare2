import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/kalkulator/controllers/calculator_controller.dart';
import 'package:overshare2/properties/calculatorbutton.dart';
import 'package:overshare2/properties/appbars.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final CalculatorController calculatorController = Get.find();

  bool button1 = false;

  bool button2 = false;

  bool button3 = false;

  bool button4 = false;

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
                    SizedBox(
                      width: 400,
                      child: Obx(
                        () => Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          calculatorController.userInput.value,
                          textAlign: TextAlign.end,
                          style: GoogleFonts.josefinSans(
                              color: const Color(0xFFFD6500), fontSize: 54.56),
                        ),
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
                                  setState(() {
                                    button1 = false;
                                    button2 = false;
                                    button3 = false;
                                    button4 = false;
                                  });
                                  calculatorController.input('C');
                                },
                              ),
                              CalculatorButton(
                                icons: Icons.backspace_outlined,
                                iconColor: Colors.black,
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
                                text: '÷',
                                backgroundColor: button1
                                    ? Colors.white
                                    : const Color(0xFFFD6500),
                                textColor: button1
                                    ? const Color(0xFFFD6500)
                                    : Colors.white,
                                onPressed: () {
                                  setState(() {
                                    button1 = !button1;
                                    button2 = false;
                                    button3 = false;
                                    button4 = false;
                                  });
                                  calculatorController.input('/');
                                },
                              )
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
                                text: 'x',
                                backgroundColor: button2
                                    ? Colors.white
                                    : const Color(0xFFFD6500),
                                textColor: button2
                                    ? const Color(0xFFFD6500)
                                    : Colors.white,
                                onPressed: () {
                                  setState(() {
                                    button1 = false;
                                    button2 = !button2;
                                    button3 = false;
                                    button4 = false;
                                  });
                                  calculatorController.input('x');
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
                                backgroundColor: button3
                                    ? Colors.white
                                    : const Color(0xFFFD6500),
                                textColor: button3
                                    ? const Color(0xFFFD6500)
                                    : Colors.white,
                                onPressed: () {
                                  setState(() {
                                    button1 = false;
                                    button2 = false;
                                    button3 = !button3;
                                    button4 = false;
                                  });
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
                                backgroundColor: button4
                                    ? Colors.white
                                    : const Color(0xFFFD6500),
                                textColor: button4
                                    ? const Color(0xFFFD6500)
                                    : Colors.white,
                                onPressed: () {
                                  setState(() {
                                    button1 = false;
                                    button2 = false;
                                    button3 = false;
                                    button4 = !button4;
                                  });
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
                                  setState(() {
                                    button1 = false;
                                    button2 = false;
                                    button3 = false;
                                    button4 = false;
                                  });
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
