import 'package:flutter/material.dart';

import '../models/app_state.dart';
import 'routes.dart';
import '../pages/pages.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final AppState appState;

  AppRouter({
    required this.appState,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appState.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appState.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        HomePage.page(),
        // ErrorPage.page(),
        // TokenomicsPage.page(),
        // FaqPage.page(),
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    return true;
  }

  @override
  // ignore: avoid_returning_null_for_void
  Future<void> setNewRoutePath(configuration) async => null;
}
