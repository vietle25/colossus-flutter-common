import 'package:colossus_flutter_common/utils/log/log_mixin.dart';
import 'package:flutter/material.dart';

import '../../utils/log/log_config.dart';

class CommonNavigatorObserver extends RouteObserver<ModalRoute<Object?>>
    with LogMixin {
  Route<dynamic>? topStackRoute;

  CommonNavigatorObserver._internal();

  static final CommonNavigatorObserver _instance =
      CommonNavigatorObserver._internal();

  factory CommonNavigatorObserver() {
    return _instance;
  }

  static const _enableLog = LogConfig.enableNavigatorObserverLog;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (_enableLog) {
      logD(
          'Route pushed: ${route.settings} -- previous route: ${previousRoute?.settings ?? ''}');
    }

    topStackRoute = route;

    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (_enableLog) {
      logD(
          'Route popped: ${route.settings} -- previous route: ${previousRoute?.settings ?? ''}');
    }

    topStackRoute = previousRoute;

    super.didPop(route, previousRoute);
  }
}
