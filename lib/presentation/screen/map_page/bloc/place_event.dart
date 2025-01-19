import 'package:flutter_prodata_task/core/model/place_model.dart';

sealed class PlacesEvent {}

final class InitialPlacesEvent extends PlacesEvent {
  final List<PlaceModel>? places;

  InitialPlacesEvent({this.places});
}
