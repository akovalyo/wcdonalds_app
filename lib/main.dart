import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';

import 'theme/theme.dart';
import 'pages/home_page.dart';
import 'models/app_state.dart';
import 'navigation/routes.dart';
import 'pages/error_page.dart';
import 'navigation/redirector.dart';

void main() {
  runApp(const WcdonaldsApp());
}

class WcdonaldsApp extends StatefulWidget {
  const WcdonaldsApp({Key? key}) : super(key: key);

  @override
  State<WcdonaldsApp> createState() => _WcdonaldsAppState();
}

class _WcdonaldsAppState extends State<WcdonaldsApp> {
  final _appState = AppState();
  late GoRouter _goRouter;

  @override
  void initState() {
    _appState.initializeApp();
    _goRouter = GoRouter(
        initialLocation: Routes.splash.path,
        routes: [
          Routes.splash,
          Routes.home,
          Routes.error,
          Routes.tokenomics,
          Routes.faq,
          Routes.webView,
        ],
        refreshListenable: _appState,
        debugLogDiagnostics: false,
        urlPathStrategy: UrlPathStrategy.path,
        redirect: (GoRouterState state) {
          return Redirector.instance.redirect(state, _appState);
        },
        errorPageBuilder: (BuildContext context, GoRouterState state) {
          return ErrorPage.page(key: state.pageKey);
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => _appState),
      ],
      child: Consumer<AppState>(
        builder: (context, appState, child) {
          ThemeData _theme =
              appState.isDarkTheme ? AppTheme.dark() : AppTheme.light();
          const String _title = 'Welcome to Wcdonalds!';

          return appState.isIos
              ? CupertinoApp.router(
                  title: _title,
                  routeInformationParser: _goRouter.routeInformationParser,
                  routerDelegate: _goRouter.routerDelegate)
              : MaterialApp.router(
                  title: _title,
                  theme: _theme,
                  routerDelegate: _goRouter.routerDelegate,
                  routeInformationParser: _goRouter.routeInformationParser,
                  debugShowCheckedModeBanner: false,
                );
        },
      ),
    );
  }
}
