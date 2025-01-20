import 'package:flutter_prodata_task/core/base/base_navigation/navigation_methods.dart';
import 'package:flutter_prodata_task/core/navigation/routes_names.dart';
import 'package:flutter_prodata_task/presentation/screen/home_page/home_page.dart';
import 'package:flutter_prodata_task/presentation/screen/map_page/map_page.dart';
import 'package:flutter_prodata_task/presentation/screen/place_details_page/place_detail_page.dart';
import 'package:go_router/go_router.dart';

class RouteManager {
  static RouteManager? _routeManager;

  RouteManager._();

  static RouteManager get instance {
    _routeManager ??= RouteManager._();

    return _routeManager!;
  }

  final GoRouter router = GoRouter(
    initialLocation: RoutesNames.initial,
    navigatorKey: NavigationMethods.instance.navigationKey,
    routes: [
      GoRoute(
        path: RoutesNames.initial,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: RoutesNames.map,
        path: RoutesNames.map,
        builder: (context, state) => const MapPage(),
      ),
      GoRoute(
        name: RoutesNames.placeDetails,
        path: "/placeDetails/:name/:address/:category/:lat/:long",
        builder: (context, state) {
          final param = state.pathParameters;

          return PlaceDetailPage(
            name: param['name'] ?? '',
            address: param['address'] ?? '',
            category: param['category'] ?? '',
            lat: param['lat'] ?? '',
            long: param['long'] ?? '',
          );
        },
      ),
    ],
  );
}
