import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static const darkTheme = 'darkTheme';

  Future<bool> isDarkTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(darkTheme) ?? false;
  }

  Future<void> saveTheme(bool val) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(darkTheme, val);
  }
}
