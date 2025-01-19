// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationState {
  final Set<Marker> markers;
  LocationState({
    required this.markers,
  });

  LocationState copyWith({
    Set<Marker>? markers,
  }) {
    return LocationState(
      markers: markers ?? this.markers,
    );
  }
}
