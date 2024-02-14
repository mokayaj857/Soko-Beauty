import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';

ThemeData darkMode = ThemeData(
  // 1. App-wide settings
    brightness: Brightness.dark,
    primaryColor: sbbrickRed,
    //accentColor: Colors.blueAccent,
    fontFamily: 'verdana',
    fontFamilyFallback: ['Helvetica'],
    package: 'Soko Beauty',
    useMaterial3: true,
    shadowColor: Colors.grey,

    //2 - floating ACTIONS BUTTON
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.red.shade400.withOpacity(0.2),
        foregroundColor: Colors.grey.shade100,
        elevation: 1,
        iconSize: 30,
        smallSizeConstraints: BoxConstraints(
          maxHeight: 50,
          maxWidth: 50,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        splashColor: Color.fromARGB(117, 255, 82, 82)),

    // 3. App Bar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: sbbrickRed,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      foregroundColor: sbbrickRed,
      backgroundColor: Colors.grey.shade900.withOpacity(0.3),
      elevation: 0,
    ),

    // 4. Bottom Navigation Bar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 10,
      backgroundColor: Colors.grey.shade900,
      unselectedItemColor: Colors.grey.shade300,
      selectedItemColor: sbbrickRed,
      selectedIconTheme: IconThemeData(size: 30),
      unselectedIconTheme: IconThemeData(size: 30),
      type: BottomNavigationBarType.fixed,
    ));
