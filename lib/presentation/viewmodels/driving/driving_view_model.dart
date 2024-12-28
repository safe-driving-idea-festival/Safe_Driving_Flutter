import 'package:flutter/material.dart';
import 'package:safe_driving/data/models/auth_model.dart';
import 'package:safe_driving/data/models/drive_model.dart';
import 'package:safe_driving/data/repositories/drive_repository.dart';

enum DrivingState {
  on,
  off,
  pause,
}

class DrivingViewModel extends ChangeNotifier {
  DrivingState _drivingState = DrivingState.off;
  final DriveRepository _driveRepository;
  DriveStopModel? _driveStopModel;
  bool _isLoading = false;

  DrivingViewModel(this._driveRepository);

  DrivingState get drivingState => _drivingState;

  DriveRepository get driveRepository => _driveRepository;


  bool get isLoading => _isLoading;

  void drivingOn(LoginResponseModel loginResponseModel) async{
    _isLoading = true;
    notifyListeners();
   await driveRepository.start(loginResponseModel);
    _drivingState = DrivingState.on;
    _isLoading = false;
    notifyListeners();
  }

  void drivingOff(LoginResponseModel loginResponseModel) async {
    _isLoading = true;
    notifyListeners();
    await driveRepository.stop(loginResponseModel);
    _drivingState = DrivingState.off;
    _isLoading = false;
    notifyListeners();
  }

  void drivingPause() {
    _drivingState = DrivingState.pause;
    notifyListeners();
  }
}
