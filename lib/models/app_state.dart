import 'package:flutter/material.dart';
import 'appCache.dart';

class AppState with ChangeNotifier {
  bool _isDarkTheme = false;
  final AppCache _appCache = AppCache();

  bool get isDarkTheme => _isDarkTheme;

  void initializeApp() async {
    _isDarkTheme = await _appCache.isDarkTheme();
  }

  void changeTheme() async {
    _isDarkTheme = !_isDarkTheme;
    await _appCache.saveTheme(_isDarkTheme);
    notifyListeners();
  }
}
