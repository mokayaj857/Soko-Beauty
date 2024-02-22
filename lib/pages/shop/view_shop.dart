import 'package:flutter/material.dart';

class ViewShopPage extends StatelessWidget {
  final String shopName;
  final String shopDescription;
  final List<String> products;

  ViewShopPage({
    required this.shopName,
    required this.shopDescription,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shopName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(shopDescription),
            SizedBox(height: 16),
            Text(
              'Products:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(products[index]),
                    // Additional details or actions can be added here
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
