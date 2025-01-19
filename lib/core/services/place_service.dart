import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_prodata_task/core/model/place_model.dart';

abstract class IPlaceService {
  Future<List<PlaceModel>?> getPlaces();
}

class PlaceService extends IPlaceService {
  @override
  Future<List<PlaceModel>?> getPlaces() async {
    final String? response =
        await rootBundle.loadString('assets/mock/places.json');

    if (response != null) {
      final parsed = jsonDecode(response);

      if (parsed is List) {
        return parsed.map((e) => PlaceModel.fromJson(e)).toList();
      }
    } else {
      return [];
    }

    return null;
  }
}
