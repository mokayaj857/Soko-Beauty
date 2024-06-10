import 'package:flutter/material.dart';
import 'package:soko_beauty/config/theme/dark.dart';
import 'package:soko_beauty/config/theme/light.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(BuildContext context) async {
   
    // Toggle the theme
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }

  }
}

