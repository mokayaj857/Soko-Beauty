import 'package:flutter/material.dart';
import 'package:soko_beauty/pages/public/splashscreen.dart';
//import 'package:soko_beauty/theme/dark.dart';
import 'package:soko_beauty/theme/light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // Restrict the app to light theme
      theme: lightMode,
      darkTheme: lightMode,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
