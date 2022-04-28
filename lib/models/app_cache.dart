import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static const darkTheme = 'darkTheme';
  static const workersList = 'workersList';

  Future<bool> isDarkTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(darkTheme) ?? false;
  }

  Future<void> saveTheme(bool val) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(darkTheme, val);
  }

  Future<void> saveList(String key, List<String> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, data);
  }

  Future<List<String>?> getList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }
}
