import 'package:flutter/material.dart';

class SelectionChips extends StatelessWidget {
  const SelectionChips({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 10, // space between chips
              children: <Widget>[
                Chip(
                  label: Text('All'),
                ),
                 Chip(
                  label: Text('Products'),
                ),
                Chip(
                  label: Text('Services'),
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
                  label: Text('Open Now'),
                ),
                Chip(
                  label: Text('Nearby'),
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