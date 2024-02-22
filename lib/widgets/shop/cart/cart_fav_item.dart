import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';
import 'package:soko_beauty/models/Product.dart';

class CartFavoriteItem extends StatelessWidget {
  final Product product;
  final VoidCallback onRemove;

  const CartFavoriteItem({
    required this.product,
    required this.onRemove,
    required Null Function() onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 8.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.network(product.imageUrl).image,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            width: 80,
            height: 80,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: sbbrickRed,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      color: sbbrickRed,
                      onPressed: () {},
                    ),
                  ],
                ),
                Text(
                  "short description",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
