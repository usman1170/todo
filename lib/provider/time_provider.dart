import 'dart:async';
import 'package:flutter/material.dart';

class TimeProvider with ChangeNotifier {
  DateTime _currentTime = DateTime.now();
  Timer? _timer;

  TimeProvider() {
    _startTimer();
  }

  DateTime get currentTime => _currentTime;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    _currentTime = DateTime.now();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
