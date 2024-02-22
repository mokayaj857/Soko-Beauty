import 'package:flutter/material.dart';
import 'package:soko_beauty/models/shop.dart';

class RecentCartegoryShopsCard extends StatelessWidget {
  final Shop shop;

  RecentCartegoryShopsCard({required this.shop});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      margin: EdgeInsets.all(8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
           
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shop.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  shop.category,
                  style: TextStyle(
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 4),
                    Text(
                      shop.rating.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      shop.isOpen ? 'Open' : 'Closed',
                      style: TextStyle(
                        color: shop.isOpen ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.blueAccent,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
