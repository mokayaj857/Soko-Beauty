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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Logo here
            FlutterLogo(size: 100),
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
              onPressed: () {},
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
            SignInButton(
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
            // Sign Up Button
            TextButton(
              child: Text('Need an account? SIGN UP'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
