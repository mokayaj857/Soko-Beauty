import "package:flutter/material.dart";
import 'package:soko_beauty/feautures/auth/data/controllers/signup_controllers.dart';
import 'package:soko_beauty/feautures/auth/views/screens/add_info.dart';
import 'package:soko_beauty/feautures/auth/views/widgets/auth_buttons.dart';
import 'package:soko_beauty/feautures/auth/views/widgets/custom_textfield.dart';
import 'package:soko_beauty/feautures/auth/views/widgets/greet_info.dart';
import 'package:soko_beauty/feautures/auth/views/widgets/signin_buttons.dart';
import 'signin.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  String? _errorText;

  SignUpController _signUpController = SignUpController();

  // Add listeners to the text controllers
  void initState() {
    super.initState();

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

    _confirmPasswordController.addListener(() {
      setState(() {
        _errorText = null;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  String? _validatePasswords(String? value) {
    if (_passwordController.text != value) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
       final result = await _signUpController.signUp(
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
        (user) {
          if (user != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => AddAccountInfo(user: user)),
            );
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 500.0,
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(30.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GreetUser(
                          title: 'Soko Beauty',
                          subtitle: 'Create your Account',
                        ),
                        SizedBox(height: 25.0),
                        CustomTextField(
                          labelText: 'Email',
                          controller: _emailController,
                          trailingIcon: Icons.mail_outlined,
                          inputType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 16.0),
                        CustomTextField(
                          labelText: 'Password',
                          controller: _passwordController,
                          obscureText: true,
                          trailingIcon: Icons.lock_clock_outlined,
                          inputType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: 16.0),
                        CustomTextField(
                          labelText: 'Confirm Password',
                          controller: _confirmPasswordController,
                          obscureText: true,
                          trailingIcon: Icons.lock_clock_outlined,
                          inputType: TextInputType.visiblePassword,
                          validator: _validatePasswords,
                          autovalidate: true,
                        ),
                        SizedBox(height: 40.0),
                        AuthButtonPrimary(
                          text: 'Sign Up',
                          onPressed: _submitForm,
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
                        Center(
                          child: Text(
                            'Or Sign Up with',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
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
                        SizedBox(height: 20.0),
                        AuthTextButton(
                            text: "Sign In",
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen()),
                              );
                            },
                            question: "Already have an account?")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
