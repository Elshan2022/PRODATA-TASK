import 'package:flutter/material.dart';
import 'package:flutter_prodata_task/core/base/base_navigation/base_navigation_methods.dart';
import 'package:go_router/go_router.dart';

class NavigationMethods extends BaseNavigationMethods {
  static NavigationMethods? _navigationMethods;

  static NavigationMethods get instance {
    _navigationMethods ??= NavigationMethods._();

    return _navigationMethods!;
  }

  NavigationMethods._();

  GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  @override
  void pop() {
    final context = navigationKey.currentContext!;
    GoRouter.of(context).pop();
  }

  @override
  Future<void> pushNamed(String routeName, {Object? arguments}) async {
    final context = navigationKey.currentContext!;
    await GoRouter.of(context).pushNamed(routeName, extra: arguments);
  }

  @override
  Future<void> pushNamedReplacement(
    String routeName, {
    Object? arguments,
  }) async {
    final context = navigationKey.currentContext!;
    GoRouter.of(context).goNamed(routeName, extra: arguments);
  }
}
