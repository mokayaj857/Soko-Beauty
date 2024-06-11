import 'package:flutter/material.dart';
import 'package:soko_beauty/config/colors/global_colors.dart';
import 'package:soko_beauty/core/views/widgets/loading.dart';
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
        child: Container(child: Image.asset('assets/logo.png', height: 130)),
      ),
    );
  }
}
