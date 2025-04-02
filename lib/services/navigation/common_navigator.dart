import 'package:auto_route/auto_route.dart';

abstract class CommonNavigator {
  Future<T?> push<T extends Object?>(PageRouteInfo appRouteInfo);

  Future<T?> pushNamed<T extends Object?>(String path);

  Future<void> pushAll(List<PageRouteInfo> listAppRouteInfo);

  Future<T?> replace<T extends Object?>(PageRouteInfo appRouteInfo);

  Future<void> replaceAll(List<PageRouteInfo> listAppRouteInfo);

  Future<void> pop({bool useRootNavigator = false});

  Future<T?> popAndPush<T extends Object?, R extends Object?>(
    PageRouteInfo appRouteInfo, {
    R? result,
    bool useRootNavigator = false,
  });

  Future<void> popAndPushAll(List<PageRouteInfo> listAppRouteInfo,
      {bool useRootNavigator = false});

  void popUntilRoot({bool useRootNavigator = false});

  void popUntilRouteName(String routeName);

  void pushAndPopUntil(PageRouteInfo routeInfo);

  bool removeUntilRouteName(String routeName);

  bool removeAllRoutesWithName(String routeName);

  bool removeLast();
}
