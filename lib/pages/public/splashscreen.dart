import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';
import 'package:soko_beauty/pages/home/main_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //authenticating user
    // FirebaseAuth auth = FirebaseAuth.instance;
    // User? user = auth.currentUser;

    // Future.delayed(Duration(seconds: 3), () {
    //   if (user != null) {
    //     //if user is signed in , navigate to home screen
    //     Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (context) => HomeScreen()),
    //     );
    //   } else {
    //     //if user is not signed in , navigate to sign in screen
    //     Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (context) => SignUpScreen()),
    //     );
    //   }
    // });

    Future.delayed(Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });

    // splash screen UI
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(

          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.topCenter,
            colors: [
            sbbrickRed.withOpacity(0.1),
            sbdarkBrown.withOpacity(0.2)
          ]),
        ),
        child: Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 120),
                SizedBox(height: 20),
                Text("SokoBeauty",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                ),
                Text(
                  'AI Powered Short-form video\nContent Platform for Beauty\nWith E-Commerce',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: sbdeepRed,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
