import 'package:go_router/go_router.dart';

import '../interfaces/redirect_interface.dart';
import '../models/app_state.dart';
import '../navigation/routes.dart';

class Redirector {
  final List<Redirect> _redirects;
  const Redirector(this._redirects);

  static Redirector get instance => Redirector([
        UninitializedRedirect(),
        InitializedRedirect(),
      ]);

  String? redirect(GoRouterState state, AppState appState) {
    final current = Uri(path: state.subloc, queryParameters: state.queryParams);
    for (final redirect in _redirects) {
      if (redirect.check(state, appState)) {
        final uri = redirect.getUri(state, appState);
        if (uri != null) {
          final uriString = uri.toString();
          if (uriString == current.toString()) {
            return null;
          }
          return uriString;
        }
      }
    }
    return null;
  }
}

// If app is not initialized redirect user to the splash screen
class UninitializedRedirect extends Redirect {
  @override
  bool check(GoRouterState state, AppState appState) => !appState.isInitialized;

  @override
  Uri? getUri(GoRouterState state, AppState appState) {
    if (state.subloc == Routes.splash.path) {
      return null;
    }
    appState.pushDestUri(Uri(path: state.subloc));
    // print('UninitializedRedirect. Dest: ${appState.destUri}');
    return Uri(path: Routes.splash.path);
  }
}

class InitializedRedirect extends Redirect {
  @override
  bool check(GoRouterState state, AppState appState) =>
      appState.isInitialized && state.subloc == Routes.splash.path;

  @override
  Uri? getUri(GoRouterState state, AppState appState) {
    Uri? destUri = appState.popDestUri();
    if (destUri != null) {
      // print('InitializedRedirect-to destination: $destUri');
      return destUri;
    }

    String next;
    //TODO: Authorized user redirection logic

    next = Routes.home.path;

    // print('InitializedRedirect');
    return Uri(path: next);
  }
}
