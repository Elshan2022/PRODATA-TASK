import 'dart:async';

import 'package:geolocator/geolocator.dart';

class LocationService {
  FutureOr<Position> getUserCurrentLocation() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied) {
        return getDefaultPosition();
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      return getDefaultPosition();
    }

    final currentPosition = await Geolocator.getCurrentPosition();

    return currentPosition;
  }

  Position getDefaultPosition() {
    return Position(
      latitude: 40.4093,
      longitude: 49.8671,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
      altitudeAccuracy: 0.0,
      headingAccuracy: 0.0,
    );
  }
}
