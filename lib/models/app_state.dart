import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  int selectedTab = 0;

  void goToTab(int tab) {
    selectedTab = tab;
    notifyListeners();
  }
}
