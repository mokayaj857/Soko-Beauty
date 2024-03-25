import 'package:flutter/material.dart';

class GreetUser extends StatelessWidget {
  const GreetUser({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 80, width: 80, child: Image.asset('assets/logo.png')),
        Text(
          title,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
        SizedBox(
          height: 40,
        ),
        Text(subtitle,
            style: TextStyle(
              fontSize: 20,
              // fontWeight: FontWeight.w100,
            )),
      ],
    );
  }
}
