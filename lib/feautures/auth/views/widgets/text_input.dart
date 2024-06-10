import 'package:flutter/material.dart';
import 'package:soko_beauty/config/colors/global_colors.dart';

class FormTextInput extends StatelessWidget {
  FormTextInput(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.keyboardType});

  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.green,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: sbwarmRed,
          ),
        ),
      ),
    );
  }
}
