import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:soko_beauty/colors/colors.dart';
import 'package:soko_beauty/pages/home/main_page.dart';
import 'package:soko_beauty/pages/auth/signupscreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
      Container(
          height: 350,
          width: 452,
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
           child:IntrinsicHeight(child:Column(
             mainAxisAlignment: MainAxisAlignment.end,

             children: [

             Card(
               margin: EdgeInsets.all(40.0),
          child:  Padding(
            padding: EdgeInsets.all(20),
               child:  Text(
                 'SOKO\nBEAUTY',
                 style: TextStyle(

                   color: sbwarmRed,
                   fontSize: 24,
                   fontWeight: FontWeight.bold,
                 ),
                 textAlign: TextAlign.center,
               ),
             ),),
             Text(
               'Everything Beauty.',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 20,
               ),
             ),
            SizedBox(height: 20,),
             Container(
               decoration: BoxDecoration(
                 color: Theme.of(context).cardColor,
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
               ),
                padding: EdgeInsets.all(10),
                 width: double.infinity,
               ),
           ],),),
          ),
            Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      SizedBox(height: 15),
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
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => HomePage()),
                          );
                        },
                      ),

                      SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (bool) {},
                          ),
                          Text('Remember me?'),
                        ],
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

                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children:[SignInButton(
                        Buttons.Google,
                        text: "Google",
                        onPressed: () {},
                      ),

                      SignInButton(
                        Buttons.FacebookNew,
                        text: "Facebook",
                        onPressed: () {},

                      ),

                      SignInButton(
                        padding: EdgeInsets.zero,

                        Buttons.AppleDark,
                        text: "Apple",
                        onPressed: () {},
                      ),]),
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


          ],
        ),
      )
    );
  }
}
