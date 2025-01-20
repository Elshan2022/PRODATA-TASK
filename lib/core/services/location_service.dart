import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
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

  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String address =
            '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
        return address;
      } else {
        return 'Address not found';
      }
    } catch (e) {
      debugPrint('Error getting address: $e');
      return 'Error getting address';
    }
  }
}
