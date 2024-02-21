import 'package:flutter/material.dart';

class NewArrivalsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.restaurant, size: 50),
            Text('Shop Name'),
            Text('Address'),
          ],
        ),
      ),
    );
  }
}
