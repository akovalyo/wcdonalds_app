import 'package:flutter/material.dart';

const Set<MaterialState> interactiveStates = <MaterialState>{
  MaterialState.pressed,
  MaterialState.hovered,
  MaterialState.focused,
};

class ThemeColors {
  static const Color main = Color(0xffdf330c);
  static const Color secondary = Color(0xfff6d61c);

  //Light theme
  static const Color backgroundL = Color.fromARGB(255, 255, 232, 232);
  static const Color textL = Colors.black;

  //Dark theme
  static const Color backgroundD = Color(0xFF303030);
  static const Color textD = Color(0xFFE0E0E0);
}
