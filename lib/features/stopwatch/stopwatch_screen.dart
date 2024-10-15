import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:overshare2/features/stopwatch/controllers/stopwatch_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/features/stopwatch/controllers/stopwatch_controller.dart';
import 'package:overshare2/properties/appbars.dart';

class StopwatchScreen extends StatelessWidget {
  StopwatchScreen({super.key});
  final StopwatchController stopwatchController = Get.find();

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
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                // Time Screen
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 22.0),
                  child: Obx(() {
                    final value = stopwatchController
                        .time.value; // Use time.value from controller
                    final milliseconds = value % 1000; // milliseconds
                    final seconds = (value ~/ 1000) % 60; // seconds
                    final minutes = (value ~/ (1000 * 60)) % 60; // minutes

                    return Text(
                      // Format output "mm.ss,ms"
                      "${minutes.toString().padLeft(2, '0')}.${seconds.toString().padLeft(2, '0')},${(milliseconds ~/ 10).toString().padLeft(2, '0')}",
                      style: const TextStyle(
                          fontSize: 68,
                          fontFamily: 'Helvetica',
                          color: Colors.white),
                    );
                  }),
                ),

                // Lap records
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Time Records',
                      style: GoogleFonts.josefinSans(
                          color: Colors.white, fontSize: 18),
                    ),
                    const Divider(),
                    SizedBox(
                      width: double.infinity,
                      height: 340,
                      child: Obx(() {
                        return ListView.builder(
                          itemCount: stopwatchController.laps.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 72,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Lap ${index + 1}',
                                          style: GoogleFonts.josefinSans(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          stopwatchController.laps[index],
                                          style: GoogleFonts.josefinSans(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 0.2,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),

                // Button controls
                SizedBox(
                  width: 275,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      // Left Button (Reset)
                      Obx(() {
                        return AnimatedPositioned(
                          duration: const Duration(milliseconds: 300),
                          bottom: stopwatchController.show.value ? 0 : 10,
                          left: stopwatchController.show.value ? 25 : 275 / 2.5,
                          child: SizedBox(
                            width: 61,
                            height: 61,
                            child: IconButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                    const Color(0xff303030)),
                              ),
                              onPressed: () {
                                stopwatchController
                                    .reset(); // Properly invoke the reset method
                              },
                              icon: const Icon(
                                Icons.restart_alt_sharp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }),

                      // Right Button (Lap)
                      Obx(() {
                        return AnimatedPositioned(
                          duration: const Duration(milliseconds: 300),
                          bottom: stopwatchController.show.value ? 0 : 10,
                          right:
                              stopwatchController.show.value ? 25 : 275 / 2.5,
                          child: SizedBox(
                            width: 61,
                            height: 61,
                            child: IconButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                    const Color(0xFF303030)),
                              ),
                              onPressed: () {
                                if (stopwatchController.started.value == 1) {
                                  stopwatchController
                                      .lap(); // Proper method invocation
                                }
                              },
                              icon: const Icon(
                                Icons.timer,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }),

                      // Mid Button (Start/Stop)
                      Obx(() {
                        return Positioned(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 12, top: 22),
                            child: SizedBox(
                              width: 92,
                              height: 92,
                              child: IconButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      const Color(0xffF07A00)),
                                ),
                                onPressed: () {
                                  if (stopwatchController.started.value == 0) {
                                    stopwatchController
                                        .start(); // Start the stopwatch
                                  } else {
                                    stopwatchController
                                        .stop(); // Stop the stopwatch
                                  }
                                },
                                icon: stopwatchController.started.value == 1
                                    ? const Icon(
                                        Icons.pause,
                                        color: Colors.white,
                                        size: 60,
                                      )
                                    : const Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                        size: 60,
                                      ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
