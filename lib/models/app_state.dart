import 'package:flutter/material.dart';

import '../interfaces/app_state_interface.dart';
import 'app_cache.dart';
import 'platform.dart';

class AppState extends AppStateInterface with ChangeNotifier {
  bool _isInitialized = false;
  bool _isDarkTheme = false;
  String _platform = Platform.android;
  final AppCache _appCache = AppCache();
  Uri? _destUri;

  @override
  bool get isInitialized => _isInitialized;

  @override
  bool get isDarkTheme => _isDarkTheme;

  @override
  String get platform => _platform;

  @override
  Uri? get destUri => _destUri;

  @override
  void initializeApp() async {
    _isDarkTheme = await _appCache.isDarkTheme();
    _platform = await Platform.check();
    _isInitialized = true;
    print(_platform);
    notifyListeners();
  }

  @override
  void changeTheme() async {
    _isDarkTheme = !_isDarkTheme;
    await _appCache.saveTheme(_isDarkTheme);
    notifyListeners();
  }

  @override
  Uri? popDestUri() {
    final dest = _destUri;
    _destUri = null;
    return dest;
  }

  @override
  void pushDestUri(Uri uri) {
    _destUri = uri;
  }
}
