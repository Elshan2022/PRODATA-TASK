// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_prodata_task/core/base/base_navigation/navigation_methods.dart';
import 'package:flutter_prodata_task/core/base/base_view_model/base_view_model.dart';
import 'package:flutter_prodata_task/core/navigation/routes_names.dart';

class HomePageViewModel extends BaseViewModel {
  @override
  void init() {
    debugPrint("INIT WORK");
  }

  @override
  void dispose() {
    debugPrint("DISPOSE WORK");
  }

  Future<void> navigateMap() async {
    await NavigationMethods.instance.pushNamed(RoutesNames.map);
  }

  @override
  void setContext(BuildContext context) {
    myContext = context;
  }
}
