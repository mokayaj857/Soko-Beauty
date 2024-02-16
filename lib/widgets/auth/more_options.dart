import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';
import 'package:soko_beauty/pages/auth/signupscreen.dart';
import 'package:soko_beauty/pages/home/main_page.dart';

class MoreSignInOptions extends StatelessWidget {
  const MoreSignInOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              backgroundColor: MaterialStateProperty.all<Color>(sbwarmRed),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()),
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
                  color: sbwarmRed, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
          ),
          SizedBox(height: 10),

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
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
