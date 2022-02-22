import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme_helper.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.chakraPetch(
      fontSize: 20.0,
      color: ThemeColors.textL,
    ),
    bodyText2: GoogleFonts.chakraPetch(
      fontSize: 20.0,
      color: ThemeColors.textL,
    ),
    headline1: GoogleFonts.pressStart2p(
      fontSize: 32.0,
      color: ThemeColors.textL,
    ),
    headline2: GoogleFonts.pressStart2p(
      fontSize: 21.0,
      color: ThemeColors.textL,
    ),
    headline3: GoogleFonts.pressStart2p(
      fontSize: 16.0,
      color: ThemeColors.textL,
    ),
    headline6: GoogleFonts.pressStart2p(
      fontSize: 20.0,
      color: ThemeColors.textL,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.chakraPetch(
      fontSize: 20.0,
      color: ThemeColors.textD,
    ),
    bodyText2: GoogleFonts.chakraPetch(
      fontSize: 20.0,
      color: ThemeColors.textD,
    ),
    headline1: GoogleFonts.pressStart2p(
      fontSize: 32.0,
      color: ThemeColors.textD,
    ),
    headline2: GoogleFonts.pressStart2p(
      fontSize: 21.0,
      color: ThemeColors.textD,
    ),
    headline3: GoogleFonts.pressStart2p(
      fontSize: 16.0,
      color: ThemeColors.textD,
    ),
    headline6: GoogleFonts.pressStart2p(
      fontSize: 20.0,
      color: ThemeColors.textD,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        secondary: ThemeColors.secondary,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return Colors.black;
        }),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: ThemeColors.main,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ThemeColors.main,
        selectedItemColor: ThemeColors.secondary,
        unselectedItemColor: Colors.white,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.light(
        brightness: Brightness.dark,
        secondary: ThemeColors.secondary,
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: ThemeColors.main,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ThemeColors.main,
        selectedItemColor: ThemeColors.secondary,
        unselectedItemColor: ThemeColors.textD,
      ),
      textTheme: darkTextTheme,
    );
  }
}
