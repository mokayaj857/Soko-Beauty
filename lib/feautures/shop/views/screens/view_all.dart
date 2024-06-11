import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/shop/data/models/shop.dart';

class ViewAllShopsScreen extends StatelessWidget {
  final List<Shop> shops;

  ViewAllShopsScreen({required this.shops});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Shops in the list'),
        actions: [
          //search icon btn
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Shops page comming soon...',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  final Shop shop;

  ShopCard({required this.shop});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              shop.imageUrl,
              width: double.infinity,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shop.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  shop.category,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  shop.description,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange),
                    SizedBox(width: 4),
                    Text(
                      shop.rating.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
