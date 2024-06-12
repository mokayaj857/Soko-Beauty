import 'package:flutter/material.dart';
import 'package:soko_beauty/config/colors/global_colors.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryVariant,
  primarySwatch: Colors.blue,
  canvasColor: Colors.grey.shade50,
  cardColor: Colors.white,
  fontFamily: 'SystemUi',
  fontFamilyFallback: ['SystemUi'],
  highlightColor: AppColors.black.withOpacity(0.8),
  package: 'Soko Beauty',
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(
    primary: AppColors.primaryVariant,
    secondary: AppColors.secondary,
    surface: Colors.white,
    error: AppColors.error,
    onPrimary: AppColors.onPrimary,
    onSecondary: AppColors.onSecondary,
    onSurface: Colors.black,
    onError: AppColors.onError,
    brightness: Brightness.light,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.red.shade50.withOpacity(0.6),
    foregroundColor: Colors.white,
    elevation: 0.0,
    iconSize: 30,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
    splashColor: Color.fromARGB(132, 255, 82, 82),
  ),
  splashFactory: NoSplash.splashFactory,
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.primary,
  ),
  tabBarTheme: TabBarTheme(
    labelColor: AppColors.primary,
    indicatorColor: AppColors.primary,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
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
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 10,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey.shade800,
    unselectedLabelStyle: TextStyle(color: Colors.grey.shade800),
    type: BottomNavigationBarType.fixed,
    selectedIconTheme: IconThemeData(color: AppColors.secondary),
    selectedLabelStyle: TextStyle(color: AppColors.secondary),
    selectedItemColor: AppColors.secondary,
  ),
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
      foregroundColor: WidgetStateProperty.all(AppColors.primaryVariant),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(EdgeInsets.all(0.0)),
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
    ),
  ),
);
