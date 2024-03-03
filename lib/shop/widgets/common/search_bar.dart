import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 55,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade600.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 15)
          ],
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: 'Search...',
              prefixIcon: IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {
                  // Handle filter button press
                },
              ),
              suffixIcon: Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
