import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';
import 'package:soko_beauty/pages/public/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 10,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          unselectedLabelStyle: TextStyle(color: Colors.white),
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: sbdeepRed),
          selectedLabelStyle: TextStyle(color: sbdeepRed),
        )
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      
    );
  }
}

