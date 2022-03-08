import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme_helper.dart';

class AppTheme {
  static const double wcBarHeight = 55.0;
  static const double paddingHorizontal = 8.0;
  static const double maxWidthWidget = 400.0;
  static const double collapsedWidgetHeight = 50.0;
  static const double expandedWidgetHeight = 220.0;

  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.chakraPetch(
      fontSize: 18.0,
      color: ThemeColors.textL,
    ),
    bodyText2: GoogleFonts.chakraPetch(
      fontSize: 16.0,
      color: ThemeColors.textL,
    ),
    headline1: GoogleFonts.pressStart2p(
      fontSize: 32.0,
      color: ThemeColors.textL,
      height: 1.5,
    ),
    headline2: GoogleFonts.pressStart2p(
      fontSize: 26.0,
      color: ThemeColors.textL,
      height: 1.5,
    ),
    headline3: GoogleFonts.pressStart2p(
      fontSize: 20.0,
      color: ThemeColors.textL,
      height: 1.5,
    ),
    headline4: GoogleFonts.pressStart2p(
      fontSize: 16.0,
      color: ThemeColors.textL,
      height: 1.5,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.chakraPetch(
      fontSize: 18.0,
      color: ThemeColors.textD,
    ),
    bodyText2: GoogleFonts.chakraPetch(
      fontSize: 16.0,
      color: ThemeColors.textD,
    ),
    headline1: GoogleFonts.pressStart2p(
      fontSize: 32.0,
      color: ThemeColors.textD,
      height: 1.5,
    ),
    headline2: GoogleFonts.pressStart2p(
      fontSize: 26.0,
      color: ThemeColors.textD,
      height: 1.5,
    ),
    headline3: GoogleFonts.pressStart2p(
      fontSize: 20.0,
      color: ThemeColors.textD,
      height: 1.5,
    ),
    headline4: GoogleFonts.pressStart2p(
      fontSize: 16.0,
      color: ThemeColors.textD,
      height: 1.5,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: ThemeColors.backgroundL,
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        background: ThemeColors.backgroundL,
        primary: ThemeColors.main,
        secondary: ThemeColors.secondary,
        tertiary: ThemeColors.textL,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: ThemeColors.backgroundL,
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
        backgroundColor: ThemeColors.main,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ThemeColors.main,
        selectedItemColor: ThemeColors.secondary,
        unselectedItemColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(ThemeColors.main),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 18,
              decoration: TextDecoration.underline,
              color: ThemeColors.main,
            ),
          ),
        ),
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ThemeColors.backgroundD,
      colorScheme: const ColorScheme.light(
        brightness: Brightness.dark,
        background: ThemeColors.backgroundD,
        primary: ThemeColors.main,
        secondary: ThemeColors.secondary,
        tertiary: ThemeColors.textD,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: ThemeColors.backgroundD,
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: ThemeColors.main,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(ThemeColors.secondary),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 18,
              decoration: TextDecoration.underline,
              color: ThemeColors.secondary,
            ),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: ThemeColors.textD,
        backgroundColor: ThemeColors.main,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ThemeColors.main,
        selectedItemColor: ThemeColors.secondary,
        unselectedItemColor: ThemeColors.textD,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(ThemeColors.secondary),
        overlayColor:
            MaterialStateProperty.all(ThemeColors.secondary.withOpacity(0.5)),
        trackColor: MaterialStateProperty.all(
          const Color(0xFFA8962C),
        ),
      ),
      textTheme: darkTextTheme,
    );
  }

  //TODO: Test edge cases
  static double getMaxWidgetWidth(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (width >= 400 + paddingHorizontal * 2) {
      return 400;
    } else {
      return 400 - paddingHorizontal * 2;
    }
  }

//TODO: Test edge cases
  static double getMaxWidgetHeight(BuildContext context, double defaultHeight) {
    final double safeHeight = MediaQuery.of(context).size.height -
        wcBarHeight -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    if (defaultHeight > safeHeight) {
      return safeHeight * 0.9;
    } else {
      return defaultHeight;
    }
  }

  static TextStyle richTextBody1Black(
    BuildContext context, {
    bool bold = false,
    bool themeColor = false,
  }) =>
      TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyText1?.fontFamily,
        color: themeColor
            ? Theme.of(context).textTheme.bodyText1?.color
            : Colors.black,
        fontSize: Theme.of(context).textTheme.bodyText1?.fontSize,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      );
}
