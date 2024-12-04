import 'package:flutter/material.dart';
import 'package:flutter_common/utils/log/log_mixin.dart';

class CommonNavigatorObserver extends RouteObserver<ModalRoute<Object?>> with LogMixin {
  Route<dynamic>? topStackRoute;

  // Private constructor
  CommonNavigatorObserver._internal();

  // Singleton instance
  static final CommonNavigatorObserver _instance = CommonNavigatorObserver._internal();

  // Factory constructor to return the singleton instance
  factory CommonNavigatorObserver() {
    return _instance;
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logD('Route pushed: ${route.settings} -- previous route: ${previousRoute?.settings ?? ''}');

    topStackRoute = route;

    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logD('Route popped: ${route.settings} -- previous route: ${previousRoute?.settings ?? ''}');

    topStackRoute = previousRoute;

    super.didPop(route, previousRoute);
  }
}
