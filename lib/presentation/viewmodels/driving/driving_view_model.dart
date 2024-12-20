import 'package:flutter/material.dart';

enum DrivingState {
  On,
  Off,
  Pause,
  BluetoothDisconnect,
}

class DrivingViewModel extends ChangeNotifier {
  DrivingState _drivingState = DrivingState.BluetoothDisconnect;

  DrivingState get drivingState => _drivingState;

  void drivingOn() {
    _drivingState = DrivingState.On;
    notifyListeners();
  }

  void drivingOff() {
    _drivingState = DrivingState.Off;
    notifyListeners();
  }

  void drivingPause() {
    _drivingState = DrivingState.Pause;
    notifyListeners();
  }

  void bluetoothConnect() {
    _drivingState = DrivingState.Off;
    notifyListeners();
  }
}
