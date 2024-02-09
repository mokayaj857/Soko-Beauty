// import 'package:flutter/material.dart';

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:soko_beauty/colors/colors.dart';
import 'package:soko_beauty/pages/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Logo here
           // FlutterLogo(size: 100),
            SizedBox(height: 50),
            // Email TextField
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Password TextField
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Remember me Checkbox
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (bool) {},
                ),
                Text('Remember me?'),
              ],
            ),
            // Login Button
            ElevatedButton(
              child: Text('LOGIN'),
              onPressed: () {
                 Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()),
                        );
              },
            ),
            SizedBox(height: 10),
            // Forgot Password
            TextButton(
              child: Text('Forgot password'),
              onPressed: () {},
            ),
            SizedBox(height: 10),
            // Divider
            Divider(color: Colors.black),
            // Social Buttons
           /* SignInButton(
              Buttons.Google,
              text: "Login with Google",
              onPressed: () {},
            ),
            SignInButton(
              Buttons.Facebook,
              text: "Login with Facebook",
              onPressed: () {},
            ),
            SizedBox(height: 20),
            // Sign Up Button*/
            TextButton(
              child: Text('Need an account? SIGN UP'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    ),
  ],
),
      ),
    );
  }
}

