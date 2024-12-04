import 'dart:async';

import 'package:flutter/material.dart';
import 'package:boot_flutter_common/utils/log/log_mixin.dart';

import '../services/navigation/common_navigator_observer.dart';

class CommonPageArg {}

abstract class CommonPage extends StatefulWidget {
  abstract final RouteSettings routeSettings;

  const CommonPage({super.key});
}

abstract class CommonPageState<T extends CommonPage> extends State<T>
    with WidgetsBindingObserver, RouteAware, LogMixin {
  final CommonNavigatorObserver _navigatorObserver = CommonNavigatorObserver();

  @visibleForTesting
  late StreamSubscription<bool>? streamNetwork;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didPopNext() {}

  @override
  void didPush() {}

  @override
  void didPop() {}

  @override
  void didPushNext() {}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    registerRouteObserverIfNeed();
  }

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  Widget body(BuildContext context);

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    unregisterRouteObserverIfNeed();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        logD('App in resumed state');
        onResumed();
        break;
      case AppLifecycleState.inactive:
        logD('App in inactive state');
        onInactive();
        break;
      case AppLifecycleState.paused:
        logD('App in paused state');
        onPaused();
        break;
      case AppLifecycleState.detached:
        logD('App in detached state');
        onDetached();
        break;
      case AppLifecycleState.hidden:
        logD('App in hidden state');
        onHidden();
        break;
    }
  }

  @mustCallSuper
  void onResumed() {}

  @mustCallSuper
  void onPageResumed() {}

  @mustCallSuper
  void onPaused() {}

  @mustCallSuper
  void onPagePaused() {}

  @mustCallSuper
  void onInactive() {}

  @mustCallSuper
  void onPageInactive() {}

  @mustCallSuper
  void onHidden() {}

  @mustCallSuper
  void onPageHidden() {}

  @mustCallSuper
  void onDetached() {}

  bool get needObserverRoute => true;

  @visibleForTesting
  void registerRouteObserverIfNeed() {
    final ModalRoute<Object?>? currentRoute = ModalRoute.of(context);
    if (needObserverRoute && currentRoute != null) {
      _navigatorObserver.subscribe(this, currentRoute);
    }
  }

  @visibleForTesting
  void unregisterRouteObserverIfNeed() {
    _navigatorObserver.unsubscribe(this);
  }
}
