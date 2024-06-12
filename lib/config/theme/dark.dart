import 'package:flutter/material.dart';
import 'package:soko_beauty/config/colors/global_colors.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryDark,
  canvasColor: AppColors.canvasDark.withOpacity(0.5),
  cardColor: AppColors.cardDark.withOpacity(0.5),
  fontFamily: 'SystemUi',
  fontFamilyFallback: ['SystemUi'],
  highlightColor: AppColors.white.withOpacity(0.8),
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
  package: 'Soko Beauty',
  textTheme: TextTheme(
    displayMedium: TextStyle(
      color: AppColors.white.withOpacity(0.8),
      fontSize: 14,
    ),
  ),
  useMaterial3: true,
  shadowColor: AppColors.shadowDark,
  colorScheme: ColorScheme.dark(
    primary: AppColors.primaryDark,
    secondary: AppColors.secondaryDark,
    error: AppColors.error,
    onPrimary: AppColors.onPrimaryDark,
    onSecondary: AppColors.onSecondaryDark,
    onSurface: AppColors.onSurfaceDark,
    onError: AppColors.onErrorDark,
    brightness: Brightness.dark,
  ),
  tabBarTheme: TabBarTheme(
    labelColor: AppColors.primaryDark,
    unselectedLabelColor: Colors.grey.shade300,
    indicatorColor: AppColors.primaryDark,
    labelStyle: TextStyle(fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.primaryDark,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryDark,
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
      color: AppColors.white.withOpacity(0.8),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    foregroundColor: AppColors.white.withOpacity(0.8),
    elevation: 0,
  ),
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.cardDark,
    disabledColor: Colors.grey.shade300,
    selectedColor: AppColors.primaryDark,
    secondarySelectedColor: AppColors.primaryDark,
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
    backgroundColor: AppColors.canvasDark,
    unselectedItemColor: Colors.grey.shade300,
    selectedItemColor: AppColors.primaryDark,
    selectedIconTheme: IconThemeData(size: 30),
    unselectedIconTheme: IconThemeData(size: 30),
    type: BottomNavigationBarType.fixed,
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: AppColors.cardDark,
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
