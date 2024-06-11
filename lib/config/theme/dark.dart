import 'package:flutter/material.dart';
import 'package:soko_beauty/config/colors/global_colors.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  canvasColor: AppColors.canvas,
  cardColor: AppColors.card,
  fontFamily: 'SystemUi',
  fontFamilyFallback: ['SystemUi'],
  package: 'Soko Beauty',
  useMaterial3: true,
  shadowColor: AppColors.shadow,
  colorScheme: ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    error: AppColors.error,
    onPrimary: AppColors.onPrimary,
    onSecondary: AppColors.onSecondary,
    onSurface: AppColors.onSurface,
    onError: AppColors.onError,
    brightness: Brightness.dark,
  ),
  tabBarTheme: TabBarTheme(
    labelColor: AppColors.primary,
    unselectedLabelColor: Colors.grey.shade300,
    indicatorColor: AppColors.primary,
    labelStyle: TextStyle(fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.primary,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    elevation: 1,
    hoverColor: Colors.transparent,
    highlightElevation: 0.0,
    foregroundColor: Colors.white,
    hoverElevation: 0.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppColors.primary,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    foregroundColor: AppColors.primary,
    elevation: 0,
  ),
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.card,
    disabledColor: Colors.grey.shade300,
    selectedColor: AppColors.primary,
    secondarySelectedColor: AppColors.primary,
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    labelStyle: TextStyle(
      color: Colors.white,
      fontSize: 13,
    ),
    secondaryLabelStyle: TextStyle(
      color: Colors.white,
      fontSize: 13,
    ),
    brightness: Brightness.dark,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 10,
    backgroundColor: AppColors.canvas,
    unselectedItemColor: Colors.grey.shade300,
    selectedItemColor: AppColors.primary,
    selectedIconTheme: IconThemeData(size: 30),
    unselectedIconTheme: IconThemeData(size: 30),
    type: BottomNavigationBarType.fixed,
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: AppColors.card,
    surfaceTintColor: Colors.transparent,
    elevation: 10,
    height: 50.0,
    padding: EdgeInsets.all(0.0),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(EdgeInsets.all(0.0)),
      foregroundColor: WidgetStateProperty.all(Colors.white70),
      iconColor: WidgetStateProperty.all(Colors.white70),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(EdgeInsets.all(0.0)),
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
    ),
  ),
);
