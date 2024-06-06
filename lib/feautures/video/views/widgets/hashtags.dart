import 'package:flutter/material.dart';

class HashtagsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 4),
      child: Text(
        "#beauty #makeup #skincare #fashion #cosmetics #haircare #beautyproducts #beautycare",
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: 15,
        ),
      ),
    );
  }
}
