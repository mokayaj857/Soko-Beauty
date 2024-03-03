import 'package:flutter/material.dart';
import 'package:soko_beauty/models/shop/shop.dart';
import 'package:soko_beauty/shop/screens/view_shop.dart';

class FavoriteShopsCard extends StatelessWidget {
  final Shop shop;

  FavoriteShopsCard({required this.shop});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.all(0),
      child: GestureDetector(
        onTap: () {
          // Navigate to shop details
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewShopPage(shop: shop),
            ),
          );
        },
        child: Hero(
          tag: shop.name,
          transitionOnUserGestures: true,
          child: Card(
            margin: EdgeInsets.all(0),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Image.network(
                    shop.imageUrl,
                    height: 120,
                    width: 180,
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
                      SizedBox(height: 4),
                      Text(
                        shop.category,
                        style: TextStyle(),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.star, color: Colors.orange),
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
        ),
      ),
    );
  }
}
