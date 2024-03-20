import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/shop/data/models/shop.dart';

class LuxuriousShopsCard extends StatelessWidget {
  final Shop shop;

  LuxuriousShopsCard({required this.shop});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 180,
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(shop.imageUrl),
                  ),
                ),
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
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    shop.category,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    shop.description,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.green),
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
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
