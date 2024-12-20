import 'package:flutter/material.dart';

enum DrivingState {
  on,
  off,
  pause,
  bluetoothDisconnect,
}

class DrivingViewModel extends ChangeNotifier {
  DrivingState _drivingState = DrivingState.bluetoothDisconnect;

  DrivingState get drivingState => _drivingState;

  void drivingOn() {
    _drivingState = DrivingState.on;
    notifyListeners();
  }

  void drivingOff() {
    _drivingState = DrivingState.off;
    notifyListeners();
  }

  void drivingPause() {
    _drivingState = DrivingState.pause;
    notifyListeners();
  }

  void bluetoothConnect() {
    _drivingState = DrivingState.off;
    notifyListeners();
  }
}
