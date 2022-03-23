import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wcdonalds_app/models/web_view_extra_wrapper.dart';

import '../models/web_view_extra_wrapper.dart';
import '../pages/pages.dart';

class Routes {
  static final splash = GoRoute(
    name: 'splash',
    path: '/',
    pageBuilder: (BuildContext context, GoRouterState state) =>
        SplashPage.page(key: state.pageKey),
  );

  static final home = GoRoute(
    name: 'home',
    path: '/home',
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
  );

  static final faq = GoRoute(
    name: 'faq',
    path: '/faq',
    pageBuilder: (BuildContext context, GoRouterState state) => FaqPage.page(
      key: state.pageKey,
    ),
  );

  static final webView = GoRoute(
    name: 'web',
    path: '/web',
    pageBuilder: (BuildContext context, GoRouterState state) =>
        WebViewPage.page(
      key: state.pageKey,
      extra: state.extra! as WebViewExtraWrapper,
    ),
  );

  static final List<String> all = [
    splash.path,
    home.path,
    error.path,
    tokenomics.path,
    faq.path,
    webView.path,
  ];

  static void popPageHandler(BuildContext context, String defaultPath) {
    try {
      context.pop();
    } catch (e) {
      context.go(defaultPath);
    }
  }
}
