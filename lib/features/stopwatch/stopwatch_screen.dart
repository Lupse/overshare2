import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overshare2/properties/appbars.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(); // Create instance.
  List<String> laps = [];
  int started = 0;
  bool returnButton = false;
  int? time;
  bool show = false;

  void start() {
    setState(() {
      show = true;
      started = 1;
      _stopWatchTimer.onStartTimer();
      _stopWatchTimer.secondTime.listen((value) => time = value);
    });
  }

  void stop() {
    setState(() {
      started = 0;
      _stopWatchTimer.onStopTimer();
      returnButton = !returnButton;
    });
  }

  void reset() {
    setState(() {
      show = false;
      started = 0;
      _stopWatchTimer.onResetTimer();
      returnButton = !returnButton;
      laps = [];
    });
  }

  void lap() {
    final currentValue =
        _stopWatchTimer.rawTime.value; // Get current time in milliseconds
    final milliseconds = currentValue % 1000; // Get milliseconds
    final seconds = (currentValue ~/ 1000) % 60; // Get seconds
    final minutes = (currentValue ~/ (1000 * 60)) % 60; // Get minutes

    // Format the lap time
    final lapTime =
        "${minutes.toString().padLeft(2, '0')}.${seconds.toString().padLeft(2, '0')},${(milliseconds ~/ 10).toString().padLeft(2, '0')}";

    setState(() {
      laps.add(lapTime); // Add lap time to the list
    });
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                // Time Screen
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 22.0),
                  child: StreamBuilder<int>(
                    stream: _stopWatchTimer.rawTime,
                    initialData: 0,
                    builder: (context, snap) {
                      final value = snap.data ?? 0;
                      final milliseconds = value % 1000; // milliseconds
                      final seconds = (value ~/ 1000) % 60; // seconds
                      final minutes = (value ~/ (1000 * 60)) % 60; // minutes

                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                // Format output "mm.ss,ms"
                                "${minutes.toString().padLeft(2, '0')}.${seconds.toString().padLeft(2, '0')},${(milliseconds ~/ 10).toString().padLeft(2, '0')}",
                                style: const TextStyle(
                                    fontSize: 68,
                                    fontFamily: 'Helvetica',
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                //Lap
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
                      child: ListView.builder(
                        itemCount: laps.length,
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
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      Text(
                                        laps[index],
                                        style: GoogleFonts.josefinSans(
                                            color: Colors.white, fontSize: 18),
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
                      ),
                    ),
                  ],
                ),

                // Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Left Button
                      show
                          ? SizedBox(
                              width: 61,
                              height: 61,
                              child: IconButton(
                                style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                  Color(0xff303030),
                                )),
                                onPressed: () {
                                  reset();
                                },
                                icon: const Icon(
                                  Icons.restart_alt_sharp,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : const SizedBox(
                              width: 61,
                              height: 61,
                            ),

                      // Mid Button
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12, top: 22),
                        child: SizedBox(
                          width: 92,
                          height: 92,
                          child: IconButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Color(0xffF07A00))),
                            onPressed: () {
                              setState(() {
                                if (started == 0) {
                                  start();
                                } else {
                                  stop();
                                }
                              });
                            },
                            icon: started == 1
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

                      // Right Button
                      show
                          ? SizedBox(
                              width: 61,
                              height: 61,
                              child: IconButton(
                                style: const ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color(0xFF303030))),
                                onPressed: () {
                                  // Call the lap method to save the lap
                                  if (started == 1 || started == 2) {
                                    lap(); // Save lap time if running
                                  }
                                },
                                icon: const Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : const SizedBox(
                              width: 61,
                              height: 61,
                            ),
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
