import 'package:flutter/material.dart';
import 'package:soko_beauty/config/colors/colors.dart';

ThemeData lightMode = ThemeData(
  // 1. App-wide settings
  brightness: Brightness.light,
  primaryColor: sbdarkBrown,
  primarySwatch: Colors.red,
  canvasColor: Colors.grey.shade50,
  cardColor: Colors.white,
  fontFamily: 'Poppins',
  fontFamilyFallback: ['Helvetica'],
  package: 'Soko Beauty',
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(
    primary: sbdarkBrown,
    secondary: sbdeepRed,
    surface: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),

  //2 - floating ACTIONS BUTTON
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.red.shade50.withOpacity(0.6),
      foregroundColor: Colors.white,
      elevation: 0.0,
      iconSize: 30,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      splashColor: Color.fromARGB(132, 255, 82, 82)),
  splashFactory: NoSplash.splashFactory,

  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: sbbrickRed,
  ),

  //TabBar Theme
  tabBarTheme: TabBarTheme(
    labelColor: sbbrickRed,
    indicatorColor: sbbrickRed,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),

  //3 - APPBAR THEME
  appBarTheme: AppBarTheme(
    scrolledUnderElevation: 0.0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),

  //4 - NAVBAR THEME
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 10,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey.shade800,
      unselectedLabelStyle: TextStyle(color: Colors.grey.shade800),
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: sbdeepRed),
      selectedLabelStyle: TextStyle(color: sbdeepRed),
      selectedItemColor: sbdeepRed),

  //5 - BottomAppbar THEME
  bottomAppBarTheme: BottomAppBarTheme(
    color: Colors.white,
    surfaceTintColor: Colors.transparent,
    elevation: 1,
    height: 50.0,
    padding: EdgeInsets.all(0.0),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(EdgeInsets.all(0.0)),
      foregroundColor: WidgetStateProperty.all(sbdarkBrown),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(EdgeInsets.all(0.0)),
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
    ),
  ),
);
