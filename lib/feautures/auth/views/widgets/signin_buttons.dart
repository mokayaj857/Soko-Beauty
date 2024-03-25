import 'package:flutter/material.dart';

class SocialSignIn extends StatelessWidget {
  final VoidCallback onGoogleSignInPressed;
  final VoidCallback onIOSSignInPressed;
  final VoidCallback onMicrosoftSignInPressed;

  SocialSignIn({
    required this.onGoogleSignInPressed,
    required this.onIOSSignInPressed,
    required this.onMicrosoftSignInPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: onGoogleSignInPressed,
          icon: Image.asset('assets/icons/google.png'),
          iconSize: 40,
        ),
        IconButton(
          onPressed: onIOSSignInPressed,
          icon: Theme.of(context).brightness == Brightness.dark
              ? Image.asset('assets/icons/ios-white.png')
              : Image.asset('assets/icons/ios.png'),
          iconSize: 40,
        ),
        IconButton(
          onPressed: onMicrosoftSignInPressed,
          icon: Image.asset('assets/icons/facebook.png'),
          iconSize: 40,
        ),
      ],
    );
  }
}
