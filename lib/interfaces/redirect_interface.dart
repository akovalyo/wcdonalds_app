import 'package:go_router/go_router.dart';

import '../models/app_state.dart';

abstract class Redirect {
  ///Checks if current redirection should take place
  bool check(GoRouterState state, AppState appState);

  Uri? getUri(GoRouterState satte, AppState appState);
}
