import 'package:go_router/go_router.dart';

import '../interfaces/redirect_interface.dart';
import '../models/app_state.dart';

class Redirector {
  final List<Redirect> _redirects;
  const Redirector(this._redirects);

  static Redirector get instance => const Redirector([]);

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
