import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';

class MyShop extends StatelessWidget {
  const MyShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My shop'),
      actions: [], 
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: sbwarmRed,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    )
    );
  }
}
