import'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final String text;

  const TagWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            ),
      ),
    );
  }
}
