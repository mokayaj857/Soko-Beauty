import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';

ThemeData darkMode = ThemeData(
  // 1. App-wide settings
  brightness: Brightness.dark,
  primaryColor: sbbrickRed,
  canvasColor: Colors.black,
  cardColor: Colors.black54,
  //accentColor: Colors.blueAccent,
  fontFamily: 'verdana',
  fontFamilyFallback: ['Helvetica'],
  package: 'Soko Beauty',
  useMaterial3: true,
  shadowColor: Colors.grey,


  //TabBar Theme
  tabBarTheme: TabBarTheme(
    labelColor: sbbrickRed,
    unselectedLabelColor: Colors.grey.shade300,
    indicatorColor: sbbrickRed,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: sbbrickRed,
  ),

  //2 - floating ACTIONS BUTTON
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.black.withOpacity(0.6),
    elevation: 1,
    hoverColor: Colors.transparent,
    highlightElevation: 0.0,
    foregroundColor: Colors.grey.shade100,
    hoverElevation: 0.0,
    //extendedIconLabelSpacing: ,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
  ),

  // 3. App Bar Theme
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: sbbrickRed,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    foregroundColor: sbbrickRed,
    backgroundColor: Colors.grey.shade900.withOpacity(0.3),
    elevation: 0,
  ),
  //chip theme
  chipTheme: ChipThemeData(
    backgroundColor: Colors.grey.shade900,
    disabledColor: Colors.grey.shade300,
    selectedColor: sbbrickRed,
    secondarySelectedColor: sbbrickRed,
    padding: EdgeInsets.all(10.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    labelStyle: TextStyle(
      color: Colors.grey.shade300,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    secondaryLabelStyle: TextStyle(
      color: Colors.grey.shade300,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    brightness: Brightness.dark,
  ),

  // 4. Bottom Navigation Bar Theme
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 10,
    backgroundColor: Colors.transparent,
    unselectedItemColor: Colors.grey.shade300,
    selectedItemColor: sbbrickRed,
    selectedIconTheme: IconThemeData(size: 30),
    unselectedIconTheme: IconThemeData(size: 30),
    type: BottomNavigationBarType.fixed, 
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: Colors.black87,
    surfaceTintColor: Colors.transparent,
    elevation: 10,
    height: 50.0,
    padding: EdgeInsets.all(0.0),
  ),
   textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
      foregroundColor: MaterialStateProperty.all(Colors.white70),
      iconColor: MaterialStateProperty.all(Colors.white70),
    ),
  ),
  // scaffold theme
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
    ),
  ),
);
