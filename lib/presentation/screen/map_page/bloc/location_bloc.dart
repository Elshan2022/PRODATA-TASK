import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prodata_task/core/services/location_service.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/bloc/location_event.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/bloc/location_state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationState(markers: {})) {
    on<InitialLocationEvent>(_onInitial);

    on<LocationByCategoryEvent>(_onCategory);
  }

  final LocationService _locationService = LocationService();

  _onInitial(InitialLocationEvent event, Emitter<LocationState> emit) async {
    Position currentPosition = await _locationService.getUserCurrentLocation();

    Set<Marker> markers = {
      Marker(
        markerId: const MarkerId('user_location'),
        position: LatLng(currentPosition.latitude, currentPosition.longitude),
        infoWindow: const InfoWindow(title: 'Your Location'),
      ),
    };

    emit(LocationState(markers: markers));
  }

  _onCategory(LocationByCategoryEvent event, Emitter<LocationState> emit) {
    if (event.places != null) {
      final places = event.places!
          .where(
            (element) => element.category == event.category,
          )
          .toList();

      final markers = places
          .map(
            (e) => Marker(
              markerId: MarkerId(e.id),
              position: LatLng(e.latitude, e.longitude),
              infoWindow: InfoWindow(title: e.name),
            ),
          )
          .toSet();

      emit(LocationState(markers: markers));
    }
  }
}
