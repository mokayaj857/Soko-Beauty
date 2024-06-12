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
    required this.buttonText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Image.asset(
          'assets/gif/nothing.gif',
          width: 150,
        ),
        SizedBox(height: 10),
        Text(
          message,
          style: TextStyle(
            fontSize: 13,
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            textStyle: TextStyle(fontSize: 12),
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
