import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopwatchController extends GetxController with WidgetsBindingObserver {
  final StopWatchTimer stopWatchTimer = StopWatchTimer(); // Create instance.
  var laps = <String>[].obs;
  var started = 0.obs;
  var returnButton = false.obs;
  var time = 0.obs;
  var show = false.obs;
  bool _isListening = false;

  //load time state
  Future<void> _loadTimerState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int savedTime = sharedPreferences.getInt('stopwatchTime') ?? 0;
    bool wasRunning = sharedPreferences.getBool('timerStarted') ?? false;

    if (savedTime > 0) {
      stopWatchTimer.setPresetTime(
          mSec: (savedTime - stopWatchTimer.rawTime.value));
      time.value = savedTime ~/ 1000;
      show.value = true;
      if (wasRunning) {
        start();
      }
    }
  }

  //save timer state to local memory pakai sharedpreference
  Future<void> _saveTimerState(int rawTime) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt('stopwatchTime', rawTime);
    await sharedPreferences.setBool('timerStarted', started.value == 1);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      //save stopwatch time ketika ke background
      _saveTimerState(stopWatchTimer.rawTime.value);
    } else if (state == AppLifecycleState.resumed) {
      _loadTimerState();
    }
  }

  void lap() {
    final currentValue =
        stopWatchTimer.rawTime.value; // Get current time in milliseconds
    final milliseconds = currentValue % 1000; // Get milliseconds
    final seconds = (currentValue ~/ 1000) % 60; // Get seconds
    final minutes = (currentValue ~/ (1000 * 60)) % 60; // Get minutes

    // Format the lap time
    final lapTime =
        "${minutes.toString().padLeft(2, '0')}.${seconds.toString().padLeft(2, '0')},${(milliseconds ~/ 10).toString().padLeft(2, '0')}";

    laps.add(lapTime); // Add lap time to the list
  }

  void reset() {
    show.value = false;
    started.value = 0;
    stopWatchTimer.onResetTimer();
    stopWatchTimer.clearPresetTime();

    time.value = 0;
    returnButton.value = !returnButton.value;
    laps.value = [];
    _saveTimerState(0);
  }

  void stop() {
    started.value = 0;
    stopWatchTimer.onStopTimer();
    returnButton.value = !returnButton.value;
  }

  void start() {
    if (started.value == 0) {
      show.value = true;
      started.value = 1;
      stopWatchTimer.onStartTimer();

      if (!_isListening) {
        _isListening = true;
        stopWatchTimer.rawTime.distinct().listen((value) {
          time.value = value; // Update time with the rawTime (in milliseconds)
        });
      }
      // Listen to rawTime instead of secondTime
    }
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    _loadTimerState();
    super.onInit();
  }

  @override
  void dispose() async {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    await stopWatchTimer.dispose();
  }
}
