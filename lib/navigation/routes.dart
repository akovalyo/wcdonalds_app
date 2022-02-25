import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/pages.dart';

class Routes {
  static final home = GoRoute(
    name: 'home',
    path: '/',
    pageBuilder: (BuildContext context, GoRouterState state) =>
        HomePage.page(key: state.pageKey),
  );

  static final error = GoRoute(
    name: 'error',
    path: '/404',
    pageBuilder: (BuildContext context, GoRouterState state) =>
        ErrorPage.page(key: state.pageKey),
  );

  static final tokenomics = GoRoute(
    name: 'tokenomics',
    path: '/tokenomics',
    pageBuilder: (BuildContext context, GoRouterState state) =>
        TokenomicsPage.page(
      key: state.pageKey,
    ),
    // routes: [home],
  );

  static final faq = GoRoute(
    name: 'faq',
    path: '/faq',
    pageBuilder: (BuildContext context, GoRouterState state) => FaqPage.page(
      key: state.pageKey,
    ),
  );

  static void popPageHandler(BuildContext context, String defaultPath) {
    try {
      context.pop();
    } catch (e) {
      context.go(defaultPath);
    }
  }
}
