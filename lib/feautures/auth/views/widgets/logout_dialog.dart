import 'package:flutter/material.dart';
import 'package:soko_beauty/core/views/widgets/custom_snackbar.dart';
import 'package:soko_beauty/feautures/auth/data/controllers/user_controllers.dart';
import 'package:soko_beauty/feautures/auth/views/screens/signin.dart';
import 'package:soko_beauty/feautures/auth/views/widgets/auth_buttons.dart';

class LogoutDialog {
  Future<void> _logout(BuildContext context) async {
    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    await UserController().logout();
    CustomSnackbar.show(context, 'success', 'Logout successful.');
    Navigator.pop(context);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignInScreen()));
  }

  Future<void> show(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              Icon(
                Icons.warning_rounded,
                size: 50.0,
                color: Colors.amber,
              ),
              SizedBox(height: 10.0),
              Text('Are you sure you want to sign out?'),
              SizedBox(height: 10.0),
              Text('You will have to sign in again to access your account.',
                  style: TextStyle(fontSize: 12.0),
                  textAlign: TextAlign.center),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AuthButtonSecondary(
                    text: "Cancel",
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                AuthButtonPrimary(
                    text: "Sign Out",
                    onPressed: () {
                      _logout(context);
                    }),
              ],
            )
          ],
        );
      },
    );
  }
}
