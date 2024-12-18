import 'package:flutter/cupertino.dart';

class BluetoothViewModel extends ChangeNotifier{
  bool _bluetooth = false;

  bool get bluetooth => _bluetooth;

  void bluetoothConnect(){
    _bluetooth = true;
    notifyListeners();
  }

  void bluetoothDisconnect(){
    _bluetooth = false;
    notifyListeners();
  }
}