import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme/theme.dart';
import 'models/app_state.dart';
import 'navigation/app_router.dart';

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
  late AppRouter _appRouter;

  @override
  void initState() {
    _appState.initializeApp();
    _appRouter = AppRouter(
      appState: _appState,
    );

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
          ThemeData theme =
              appState.isDarkTheme ? AppTheme.dark() : AppTheme.light();

          return MaterialApp(
            title: 'Welcome to Wcdonalds!',
            theme: theme,
            home: Router(
              routerDelegate: _appRouter,
              backButtonDispatcher: RootBackButtonDispatcher(),
            ),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
