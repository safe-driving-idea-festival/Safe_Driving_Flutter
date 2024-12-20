import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:safe_driving/data/repositories/location_repository.dart';

class LocationViewModel extends ChangeNotifier {
  final LocationRepository _locationRepository;

  LocationViewModel(this._locationRepository);

  Position? _startPosition;
  Position? _currentPosition;
  double _totalDistance = 0.0;

  StreamSubscription<Position>? _positionStreamSubscription;

  double get totalDistance => _totalDistance;

  Future<void> initializeLocation() async {
    try {
      _startPosition = await _locationRepository.getCurrentPosition();
      _trackDistance();
    } catch (e) {
      print('Error initializing location: $e');
    }
    notifyListeners();
  }

  void _trackDistance() {
    _positionStreamSubscription =
        _locationRepository.getPositionStream(distanceFilter: 10).listen((position) {
          if (_startPosition == null) {
            _startPosition = position;
          } else {
            double distance = Geolocator.distanceBetween(
              _currentPosition?.latitude ?? _startPosition!.latitude,
              _currentPosition?.longitude ?? _startPosition!.longitude,
              position.latitude,
              position.longitude,
            );
            if (distance >= 10) {
              _totalDistance += distance / 1000;
              _currentPosition = position;
              notifyListeners();
            }
          }
        });
  }

  void stopPositionStream() {
    _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
    notifyListeners();
  }

  void resetTotalDistance() {
    _totalDistance = 0.0;
    notifyListeners();
  }
}