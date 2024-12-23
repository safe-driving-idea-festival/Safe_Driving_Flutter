import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:safe_driving/data/models/location_model.dart';

abstract class LocationRepository {
  Future<void> startTracking();
  Future<void> stopTracking();
  Stream<LocationModel> get distanceStream;
}

class LocationRepositoryImpl implements LocationRepository {
  Position? _lastPosition;
  double _totalDistance = 0.0;
  final StreamController<LocationModel> _distanceController = StreamController.broadcast();

  @override
  Stream<LocationModel> get distanceStream => _distanceController.stream;

  @override
  Future<void> startTracking() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }

    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.best, distanceFilter: 10),
    ).listen((Position position) {
      if (_lastPosition != null) {
        final distance = Geolocator.distanceBetween(
          _lastPosition!.latitude,
          _lastPosition!.longitude,
          position.latitude,
          position.longitude,
        );

        _totalDistance += distance / 1000;
        _distanceController.add(LocationModel(distance: _totalDistance));
      }
      _lastPosition = position;
    });
  }

  @override
  Future<void> stopTracking() async {
    _distanceController.close();
  }
}