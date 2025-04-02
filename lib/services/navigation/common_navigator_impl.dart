import 'package:auto_route/auto_route.dart';
import 'package:colossus_flutter_common/services/navigation/common_navigator.dart';
import 'package:flutter/material.dart';

import '../../utils/log/log_config.dart';
import '../../utils/log/log_mixin.dart';

class CommonNavigatorImpl extends CommonNavigator with LogMixin {
  late final StackRouter _router;

  CommonNavigatorImpl({required BuildContext context}) : super() {
    _router = context.router;
  }

  @override
  Future<T?> push<T extends Object?>(PageRouteInfo appRouteInfo) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('push $appRouteInfo');
    }

    return _router.push<T>(appRouteInfo);
  }

  @override
  Future<T?> pushNamed<T extends Object?>(String path) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('pushNamed $path');
    }

    return _router.pushNamed(path);
  }

  @override
  Future<void> pushAll(List<PageRouteInfo> listAppRouteInfo) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('pushAll $listAppRouteInfo');
    }

    return _router.pushAll(listAppRouteInfo);
  }

  @override
  Future<T?> replace<T extends Object?>(PageRouteInfo appRouteInfo) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('replace by $appRouteInfo');
    }

    return _router.replace<T>(appRouteInfo);
  }

  @override
  Future<void> replaceAll(List<PageRouteInfo> listAppRouteInfo) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('replaceAll by $listAppRouteInfo');
    }

    return _router.replaceAll(listAppRouteInfo);
  }

  @override
  Future<void> pop({bool useRootNavigator = false}) async {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('popped , useRootNav = $useRootNavigator');
    }

    _router.back();
    return;
  }

  @override
  Future<T?> popAndPush<T extends Object?, R extends Object?>(
    PageRouteInfo appRouteInfo, {
    R? result,
    bool useRootNavigator = false,
  }) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD(
          'popAndPush $appRouteInfo with result = $result, useRootNav = $useRootNavigator');
    }

    return _router.popAndPush<T, R>(appRouteInfo, result: result);
  }

  @override
  void popUntilRoot({bool useRootNavigator = false}) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('popUntilRoot, useRootNav = $useRootNavigator');
    }

    _router.popUntilRoot();
  }

  @override
  void popUntilRouteName(String routeName) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('popUntilRouteName $routeName');
    }

    _router.popUntilRouteWithName(routeName);
  }

  @override
  bool removeUntilRouteName(String routeName) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('removeUntilRouteName $routeName');
    }

    return _router.removeUntil((route) => route.name == routeName);
  }

  @override
  bool removeAllRoutesWithName(String routeName) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('removeAllRoutesWithName $routeName');
    }

    return _router.removeWhere((route) => route.name == routeName);
  }

  @override
  Future<void> popAndPushAll(List<PageRouteInfo> listAppRouteInfo,
      {bool useRootNavigator = false}) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('popAndPushAll $listAppRouteInfo, useRootNav = $useRootNavigator');
    }

    return _router.popAndPushAll(listAppRouteInfo);
  }

  @override
  Future<void> pushAndPopUntil(PageRouteInfo routeInfo) {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('pushAndPopUntil $routeInfo');
    }

    return _router.pushAndPopUntil(
      routeInfo,
      predicate: (_) => false,
    );
  }

  @override
  bool removeLast() {
    if (LogConfig.enableNavigatorObserverLog) {
      logD('removeLast');
    }

    return _router.removeLast();
  }
}
