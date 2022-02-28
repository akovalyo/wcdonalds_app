import 'package:flutter/material.dart';

import '../interfaces/app_state_interface.dart';
import 'app_cache.dart';

class AppState extends AppStateInterface with ChangeNotifier {
  bool _isDarkTheme = false;
  final AppCache _appCache = AppCache();

  @override
  bool get isDarkTheme => _isDarkTheme;

  @override
  void initializeApp() async {
    _isDarkTheme = await _appCache.isDarkTheme();
    notifyListeners();
  }

  @override
  void changeTheme() async {
    _isDarkTheme = !_isDarkTheme;
    await _appCache.saveTheme(_isDarkTheme);
    notifyListeners();
  }
}
