import 'package:shared_preferences/shared_preferences.dart';

class PaycheckCalculator {
  final workersDataKey = 'workersData';
  List<String>? workersData;

  void save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(workersDataKey, workersData as List<String>);
  }

  void load() async {
    final prefs = await SharedPreferences.getInstance();
    workersData = prefs.getStringList(workersDataKey);
  }

  int getSize() {
    return workersData != null ? workersData!.length : 0;
  }
}
