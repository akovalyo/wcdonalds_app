import 'package:flutter/material.dart';
import 'app_cache.dart';

class AppState with ChangeNotifier {
  bool _isDarkTheme = false;
  final AppCache _appCache = AppCache();

  bool get isDarkTheme => _isDarkTheme;

  void initializeApp() async {
    _isDarkTheme = await _appCache.isDarkTheme();
    notifyListeners();
  }

  void changeTheme() async {
    _isDarkTheme = !_isDarkTheme;
    await _appCache.saveTheme(_isDarkTheme);
    notifyListeners();
  }
}
