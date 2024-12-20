import 'package:geolocator/geolocator.dart';

abstract class LocationRepository {
  Future<Position> getCurrentPosition();
  Stream<Position> getPositionStream({required int distanceFilter});
}

class GeolocatorLocationRepository implements LocationRepository {
  @override
  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition();
  }

  @override
  Stream<Position> getPositionStream({required int distanceFilter}) {
    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.low,
      distanceFilter: distanceFilter,
    );
    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }
}