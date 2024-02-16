import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';

class TextInput extends StatelessWidget {
  const TextInput({super.key});
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: TextStyle(
          color: sbwarmRed,
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
