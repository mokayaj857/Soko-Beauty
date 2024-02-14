import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';

ThemeData lightMode = ThemeData(
    // 1. App-wide settings
    brightness: Brightness.light,
    primaryColor: Colors.green,
    fontFamily: 'verdana',
    fontFamilyFallback: ['Helvetica'],
    package: 'Soko Beauty',
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.grey.shade100,
    //2 - floating ACTIONS BUTTON
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.black.withOpacity(0.1),
        foregroundColor: Colors.grey.shade100,
        elevation: 0.4,
        iconSize: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        splashColor: Color.fromARGB(132, 255, 82, 82)),

    //3 - APPBAR THEME
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: sbdeepRed,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      foregroundColor: sbdeepRed,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),

    //4 - NAVBAR THEME
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 10,
        backgroundColor: Colors.red.shade50,
        unselectedItemColor: Colors.grey.shade800,
        unselectedLabelStyle: TextStyle(color: Colors.grey.shade800),
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: sbdeepRed),
        selectedLabelStyle: TextStyle(color: sbdeepRed),
        selectedItemColor: sbdeepRed));
