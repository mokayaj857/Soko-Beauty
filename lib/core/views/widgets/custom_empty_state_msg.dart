import 'package:flutter/material.dart';

class EmptyStateMessage extends StatelessWidget {
  final String message;
  final IconData icon;
  final String buttonText;
  final VoidCallback onPressed;

  const EmptyStateMessage({
    Key? key,
    required this.message,
    required this.onPressed,
    required this.buttonText, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Image.asset(
          'assets/gif/nothing.gif',
          width: 200,
          height: 200,
        ),
        SizedBox(height: 20),
        Text(
          message,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
                SizedBox(height: 20),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            foregroundColor: Colors.white,
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon),
              SizedBox(width: 10),
              Text(buttonText),
            ],
          ),
        ),
      ],
    );
  }
}
