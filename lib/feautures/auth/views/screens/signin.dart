import "package:flutter/material.dart";
import 'package:soko_beauty/feautures/auth/data/controllers/signin_controllers.dart';
import 'package:soko_beauty/feautures/auth/views/widgets/auth_buttons.dart';
import 'package:soko_beauty/feautures/auth/views/widgets/custom_textfield.dart';
import 'package:soko_beauty/feautures/auth/views/widgets/greet_info.dart';
import 'package:soko_beauty/feautures/auth/views/widgets/signin_buttons.dart';
import 'package:soko_beauty/home/screens/landing/landing.dart';

import 'signup.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String? _errorText;

  SignInController _signInController = SignInController();
 

  // Method to submit the form
  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
     final result = await _signInController.signIn(
        context,
        _emailController.text,
        _passwordController.text,
      );
      result.fold(
        (errorMessage) {
          setState(() {
            _errorText = errorMessage;
          });
        },
        (signedIn) async {
          if (signedIn == true) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LandingPage()),
            );
          }
        },
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 50.0),
            Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 500.0,
                ),
                child: Form(
                  key: _formKey,
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GreetUser(
                          title: 'Soko Beauty',
                          subtitle: 'Sign In to your Account',
                        ),
                        SizedBox(height: 25.0),
                        CustomTextField(
                          labelText: 'Email',
                          controller: _emailController,
                          trailingIcon: Icons.mail_outlined,
                          inputType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 25.0),
                        CustomTextField(
                          labelText: 'Password',
                          controller: _passwordController,
                          obscureText: true,
                          trailingIcon: Icons.lock_clock_outlined,
                          inputType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: 10.0),
                        if (_errorText != null)
                          Text(
                            (_errorText! + " Please try again."),
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14.0,
                            ),
                          ),
                        SizedBox(height: 20.0),
                        AuthButtonPrimary(
                          text: 'Sign In',
                          onPressed: _submitForm,
                        ),
                        SizedBox(height: 20.0),
                        Center(
                          child: Text(
                            'Or Sign In with',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08),
                        SocialSignIn(
                          onGoogleSignInPressed: () {
                            // Call method to sign in with Google
                          },
                          onIOSSignInPressed: () {
                            // Call method to sign in with Apple
                          },
                          onMicrosoftSignInPressed: () {
                            // Call method to sign in with Microsoft
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 10.0),
                AuthTextButton(
                  text: "Forgot Password?",
                  onPressed: () {
                    // Navigate to the forgot password screen
                  },
                  question: "",
                ),
                SizedBox(height: 10.0),
                AuthTextButton(
                  text: "Sign Up",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUpScreen()),
                    );
                  },
                  question: "Don't have an account?",
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
   @override
  void initState() {
    super.initState();

    // Add listeners to the text controllers
    _emailController.addListener(() {
      setState(() {
        _errorText = null;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        _errorText = null;
      });
    });
  }
}
