import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUtils {
  Future<void> updateCameraLocation(
    List<LatLng> locations,
    GoogleMapController mapController,
  ) async {
    double minLat = locations.first.latitude;
    double maxLat = locations.first.latitude;
    double minLng = locations.first.longitude;
    double maxLng = locations.first.longitude;

    for (LatLng location in locations) {
      minLat = location.latitude < minLat ? location.latitude : minLat;
      maxLat = location.latitude > maxLat ? location.latitude : maxLat;
      minLng = location.longitude < minLng ? location.longitude : minLng;
      maxLng = location.longitude > maxLng ? location.longitude : maxLng;
    }

    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );

    const padding = 120.0;

    CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, padding);

    await mapController.animateCamera(cameraUpdate);
  }
}
