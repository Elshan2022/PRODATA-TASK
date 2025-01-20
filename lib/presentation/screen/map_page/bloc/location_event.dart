import 'dart:async';

import 'package:flutter_prodata_task/core/model/place_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

sealed class LocationEvent {}

final class InitialLocationEvent extends LocationEvent {}

final class LoadingLocationEvent extends LocationEvent {
  final bool? isLoading;

  LoadingLocationEvent({this.isLoading});
}

final class LocationByCategoryEvent extends LocationEvent {
  final String? category;
  final List<PlaceModel>? places;

  LocationByCategoryEvent({this.category, this.places});
}

final class ResetLocationEvent extends LocationEvent {
  final Completer<GoogleMapController> controller;
  ResetLocationEvent({required this.controller});
}

final class SearchEvent extends LocationEvent {
  final String query;
  final List<PlaceModel> places;
  final Completer<GoogleMapController> controller;

  SearchEvent(this.query, this.places, this.controller);
}
