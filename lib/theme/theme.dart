import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.chakraPetch(
      fontSize: 20.0,
      // fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyText2: GoogleFonts.chakraPetch(
      fontSize: 20.0,
      // fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: GoogleFonts.pressStart2p(
      fontSize: 32.0,
      // fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.pressStart2p(
      fontSize: 21.0,
      // fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.pressStart2p(
      fontSize: 16.0,
      // fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: GoogleFonts.pressStart2p(
      fontSize: 20.0,
      // fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.chakraPetch(
      fontSize: 20.0,
      // fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyText2: GoogleFonts.chakraPetch(
      fontSize: 20.0,
      // fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: GoogleFonts.pressStart2p(
      fontSize: 32.0,
      // fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.pressStart2p(
      fontSize: 21.0,
      // fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.pressStart2p(
      fontSize: 16.0,
      // fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.pressStart2p(
      fontSize: 20.0,
      // fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        secondary: Color(0xfff6d61c),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return Colors.black;
        }),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xffdf330c),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xffdf330c),
        selectedItemColor: Color(0xfff6d61c),
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
        secondary: Color(0xfff6d61c),
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: darkTextTheme,
    );
  }
}
