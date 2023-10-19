import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  Timer _time = Timer.periodic(const Duration(seconds: 1), (Timer timer) {});

  get time => _time;

  int lastTick = 0;
  get lastTickTime => lastTick;

  void reset() {
    _time = Timer.periodic(const Duration(seconds: 1), (Timer timer) {});
    notifyListeners();
  }

  /// 타이머를 시작합니다.
  /// 1초마다 _time을 1씩 증가시킵니다.
  /// 마지막 tick으로 부터 시작합니다.
  void startTimer() {
    _time = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      lastTick++;
      notifyListeners();
    });
  }

  /// 타이머를 멈춥니다.
  void stopTimer() {
    _time.cancel();
    notifyListeners();
  }
}
