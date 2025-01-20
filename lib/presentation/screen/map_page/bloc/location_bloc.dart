import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prodata_task/core/base/base_cache/base_cache.dart';
import 'package:flutter_prodata_task/core/base/base_navigation/navigation_methods.dart';
import 'package:flutter_prodata_task/core/cache/database/app_database.dart';
import 'package:flutter_prodata_task/core/initilaize/database_instance.dart';
import 'package:flutter_prodata_task/core/model/place_model.dart';
import 'package:flutter_prodata_task/core/navigation/routes_names.dart';
import 'package:flutter_prodata_task/core/services/location_service.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/bloc/location_event.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/bloc/location_state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationState(markers: {})) {
    on<InitialLocationEvent>(_onInitial);

    on<LocationByCategoryEvent>(_onCategory);

    on<ResetLocationEvent>(_onReset);

    on<SearchEvent>(_onSearch);
  }

  final LocationService _locationService = LocationService();
  final BaseCache _baseCache = BaseCache();

  _onInitial(InitialLocationEvent event, Emitter<LocationState> emit) async {
    Position currentPosition = await _locationService.getUserCurrentLocation();

    await _baseCache.addItem(
      DatabaseInstance.instance.appDatabase.userLocation,
      UserLocationCompanion.insert(
        latitude: currentPosition.latitude,
        longitude: currentPosition.longitude,
      ),
    );

    Set<Marker> markers = {
      _marker(
        const MarkerId('user_location'),
        LatLng(currentPosition.latitude, currentPosition.longitude),
        'Your Location',
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
            (model) => _marker(
              MarkerId(model.id),
              LatLng(model.latitude, model.longitude),
              model.name,
              model,
            ),
          )
          .toSet();

      emit(LocationState(markers: markers));
    }
  }

  _onReset(ResetLocationEvent event, Emitter<LocationState> emit) async {
    final positions = await _baseCache.getItem(
      DatabaseInstance.instance.appDatabase.userLocation,
    );

    final lat = positions[0].latitude;
    final long = positions[0].longitude;

    Set<Marker> markers = {
      _marker(
        const MarkerId('user_location'),
        LatLng(lat, long),
        'Your Location',
      ),
    };

    emit(LocationState(markers: markers));

    final mapController = await event.controller.future;

    CameraUpdate cameraUpdate = CameraUpdate.newLatLngZoom(
      LatLng(lat, long),
      14.0,
    );

    await mapController.animateCamera(cameraUpdate);
  }

  _onSearch(SearchEvent event, Emitter<LocationState> emit) async {
    final places = event.places;
    final query = event.query.toLowerCase();

    final result = places.where(
      (element) {
        final name = element.name.toLowerCase();
        return name.contains(query);
      },
    ).toList();

    final markers = result
        .map(
          (model) => _marker(
            MarkerId(model.id),
            LatLng(model.latitude, model.longitude),
            model.name,
            model,
          ),
        )
        .toSet();

    emit(LocationState(markers: markers));

    final mapController = await event.controller.future;
    final latitude = markers.first.position.latitude;
    final longitude = markers.first.position.longitude;

    CameraUpdate cameraUpdate = CameraUpdate.newLatLngZoom(
      LatLng(latitude, longitude),
      14.0,
    );

    await mapController.animateCamera(cameraUpdate);
  }

  Marker _marker(
    MarkerId markerId,
    LatLng positions,
    String infoWindow, [
    PlaceModel? model,
  ]) {
    return Marker(
      markerId: markerId,
      position: positions,
      infoWindow: InfoWindow(title: infoWindow),
      onTap: () {
        NavigationMethods.instance.pushNamed(
          RoutesNames.placeDetails,
          arguments: {
            'name': model?.name ?? '',
            'address': model?.address ?? '',
            'category': model?.category ?? '',
            'lat': model?.latitude.toString() ?? '',
            'long': model?.longitude.toString() ?? '',
          },
        );
      },
    );
  }
}
