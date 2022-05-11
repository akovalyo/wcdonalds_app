import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/app_state_interface.dart';
import 'platform.dart';

class AppState extends AppStateInterface with ChangeNotifier {
  bool _isInitialized = false;
  bool _isDarkTheme = false;
  String _platform = PlatformInfo.android;
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
    final prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool('darkTheme') ?? false;
    _platform = await PlatformInfo.check();
    _isInitialized = true;
    notifyListeners();
  }

  @override
  void changeTheme() async {
    _isDarkTheme = !_isDarkTheme;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkTheme', _isDarkTheme);

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
