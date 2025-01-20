// ignore_for_file: file_names, use_build_context_synchronously
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prodata_task/core/base/base_navigation/navigation_methods.dart';
import 'package:flutter_prodata_task/core/base/base_view_model/base_view_model.dart';
import 'package:flutter_prodata_task/core/model/place_model.dart';
import 'package:flutter_prodata_task/core/services/place_service.dart';
import 'package:flutter_prodata_task/core/utils/map_utils.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/bloc/location_bloc.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/bloc/location_event.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/bloc/place_bloc.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/bloc/place_event.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPageViewModel extends BaseViewModel {
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final MapUtils _mapUtils = MapUtils();
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  final ValueNotifier<String> selectedCategory = ValueNotifier<String>("");
  final PlaceService _placeService = PlaceService();

  final List<String> places = [
    'apple',
    'banana',
    'blueberry',
    'cherry',
    'grape',
    'orange',
  ];

  @override
  void init() {
    _init();
  }

  @override
  void dispose() {
    _dispose();
  }

  @override
  void setContext(BuildContext context) {
    myContext = context;
  }

  Future<void> _init() async {
    await displayUserCurrentLocation(myContext);
    await _getPlaces();
  }

  void _dispose() {}

  void pop() {
    NavigationMethods.instance.pop();
  }

  Future<void> displayUserCurrentLocation(BuildContext context) async {
    myContext.read<LocationBloc>().add(InitialLocationEvent());
  }

  Future<void> _getPlaces() async {
    final places = await _placeService.getPlaces();
    myContext.read<PlaceBloc>().add(InitialPlacesEvent(places: places));
  }

  void resetCategory() {
    selectedCategory.value = "";
  }

  void onCategory(String category, List<PlaceModel> places) async {
    selectedCategory.value = category;

    myContext.read<LocationBloc>().add(
          LocationByCategoryEvent(
            category: category,
            places: places,
          ),
        );

    List<LatLng> placeLocations = places.map((place) {
      return LatLng(place.latitude, place.longitude);
    }).toList();

    if (controller.isCompleted) {
      final mapController = await controller.future;
      _mapUtils.updateCameraLocation(placeLocations, mapController);
    }
  }

  Future<void> refreshLocation() async {
    myContext
        .read<LocationBloc>()
        .add(ResetLocationEvent(controller: controller));

    resetCategory();
  }

  Future<void> onSearch(String query, List<PlaceModel> places) async {
    myContext.read<LocationBloc>().add(SearchEvent(query, places, controller));
    resetCategory();
  }
}
