import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/shared/theme/colors/colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 20.0,
    ),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    elevation: 0.0,
    color: Colors.white,
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: defaultDarkModeColor,
    foregroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: defaultDarkModeColor,
        statusBarIconBrightness: Brightness.light),
  ),
  scaffoldBackgroundColor: defaultDarkModeColor,
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: Colors.grey,
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w700,
      fontSize: 16.0,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: defaultDarkModeColor,
      elevation: 10.0,
      unselectedItemColor: Colors.grey),
);
