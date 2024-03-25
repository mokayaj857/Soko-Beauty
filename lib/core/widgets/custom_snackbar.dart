import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(BuildContext context, String type, String message) {
    Color backgroundColor;
    IconData iconData;

    switch (type) {
      case 'info':
        backgroundColor = Colors.blue.withOpacity(0.8);
        iconData = Icons.info_outline;
        break;
      case 'warning':
        backgroundColor = Colors.orange.withOpacity(0.8);
        iconData = Icons.warning;
        break;
      case 'error':
        backgroundColor = Colors.red.withOpacity(0.8);
        iconData = Icons.error_outline;
        break;
      case 'success':
        backgroundColor = Colors.green.withOpacity(0.8);
        iconData = Icons.check_circle_outline;
        break;
      default:
        backgroundColor = Colors.grey.withOpacity(0.8);
        iconData = Icons.info_outline;
    }

    final snackBar = SnackBar(
      showCloseIcon: true,
      margin: EdgeInsets.all(20.0),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      animation: CurvedAnimation(
        parent: AnimationController(
          duration: const Duration(milliseconds: 500),
          animationBehavior: AnimationBehavior.preserve,
          vsync: Navigator.of(context),
        ),
        curve: Curves.easeOut,
      ),
      content: Row(
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
