import 'package:flutter_prodata_task/core/model/place_model.dart';

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
