import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class SignInButtons extends StatelessWidget {
  const SignInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      SignInButton(
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
      ),
    ]);
  }
}
