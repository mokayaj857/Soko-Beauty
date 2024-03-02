import 'package:flutter/material.dart';

class ProductSelectionChips extends StatelessWidget {
  const ProductSelectionChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 10, // space between chips
        children: <Widget>[
          Chip(
            label: Text('All'),
          ),
          Chip(
            label: Text('Offers'),
          ),
          Chip(
            label: Text('New Arrivals'),
          ),
          Chip(
            label: Text('Most Popular'),
          ),
          Chip(
            label: Text('Top Rated'),
          ),
          // Add more chips as needed
        ],
      ),
    );
  }
}
