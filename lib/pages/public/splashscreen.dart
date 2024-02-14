import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';
import 'package:soko_beauty/pages/auth/loginscreen.dart';

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

    Future.delayed(Duration(seconds: 3), () {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  });

    // splash screen UI
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              sbwarmRed,
              sbdarkBrown,
            ],
          ),
        ),
        //linear gradient hapa
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(top: 70),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Text(
                'SOKO\nBEAUTY',
                style: TextStyle(
                  color: sbwarmRed,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 7),
            Text(
              'Everything Beauty.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 100),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('lib/images/splashscreencicon.png',
                        height: 120),
                    SizedBox(height: 20),
                    Text(
                      'AI Powered Short-form video\nContent Platform for Beauty\nWith E-Commerce',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: sbdeepRed,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // other widgets hapa
          ],
        ),
      ),
    );
  }
}
