import 'package:flutter/material.dart';
import 'package:soko_beauty/config/colors/global_colors.dart';
import 'package:soko_beauty/landing.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 120),
            SizedBox(height: 10),
            Text("SokoBeauty",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: sbdeepRed,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
