import 'package:flutter/foundation.dart';
import 'package:safe_driving/data/models/location_model.dart';
import 'package:safe_driving/data/repositories/location_repository.dart';

class LocationViewModel extends ChangeNotifier {
  final LocationRepository _repository;

  LocationViewModel(this._repository);

  LocationModel? _distanceModel = LocationModel(distance: 0, x: 0, y: 0);
  String? _errorMessage;

  LocationModel? get distanceModel => _distanceModel;

  String? get errorMessage => _errorMessage;

  Future<void> startTracking() async {
    try {
      await _repository.startTracking();
      _repository.distanceStream.listen((distanceModel) {
        _distanceModel = distanceModel;
        notifyListeners();
      });
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> stopTracking() async {
    await _repository.stopTracking();
    notifyListeners();
  }

  Future<void> resetDistance() async {
    await _repository.stopTracking();
    _distanceModel = LocationModel(distance: 0, x: 0, y: 0);
    notifyListeners();
  }
}
