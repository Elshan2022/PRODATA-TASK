// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_prodata_task/core/model/place_model.dart';

class PlaceState {
  final List<PlaceModel>? places;
  PlaceState({this.places});

  PlaceState copyWith({
    List<PlaceModel>? places,
  }) {
    return PlaceState(
      places: places ?? this.places,
    );
  }
}
