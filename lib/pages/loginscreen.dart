import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:soko_beauty/colors/colors.dart';
import 'package:soko_beauty/pages/homescreen.dart';
import 'package:soko_beauty/pages/signupscreen.dart';

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(50),
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
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: sbwarmRed,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        // Email TextField
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: sbwarmRed,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: sbwarmRed,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Password TextField
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: sbwarmRed,
                              ),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: sbwarmRed,
                            ),
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
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(sbwarmRed),
                          ),
                          onPressed: () {
                            // Navigator.of(context).pushReplacement(
                            //   MaterialPageRoute(
                            //       builder: (context) => HomeScreen()),
                            // );
                          },
                        ),
                        SizedBox(height: 10),
                        // Forgot Password
                        TextButton(
                          child: Text(
                            'Forgot password ?',
                            style: TextStyle(
                                color: sbwarmRed,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(height: 10),

                        SignInButton(
                          Buttons.Google,
                          text: "Log in with Google",
                          onPressed: () {},
                        ),

                        SignInButton(
                          Buttons.FacebookNew,
                          text: "Log in with Facebook",
                          onPressed: () {},
                        ),

                        SignInButton(
                          Buttons.AppleDark,
                          text: "Log in with Apple",
                          onPressed: () {},
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                color: sbwarmRed,
                                fontSize: 16,
                              ),
                             // textAlign: TextAlign.center,
                            ),
                            TextButton(
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                                color: sbdeepRed,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                        ),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
          //linear gradient hapa
          //        child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [

          //     Expanded(
          //       child: Container(
          //         width: MediaQuery.of(context).size.width,
          //         decoration: BoxDecoration(
          //
          //         ),
          //         child: Padding(
          //           padding: const EdgeInsets.all(7.0),
          //         child:
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
