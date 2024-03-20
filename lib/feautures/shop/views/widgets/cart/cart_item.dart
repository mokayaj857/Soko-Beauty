import 'package:flutter/material.dart';
import 'package:soko_beauty/config/colors/colors.dart';
import 'package:soko_beauty/feautures/shop/data/models/Product.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final VoidCallback onRemove;

  const CartItem({
    required this.product,
    required this.onRemove,
    required Null Function() onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).canvasColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
                width: 100,
                height: 100,
                child: Image.asset(
                'assets/1015-300x201.jpg', // Path to your image asset
                fit: BoxFit
                    .cover, // Adjust how the image fits inside the container
              ),
               ),
            SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: sbbrickRed,
                    ),
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_rounded),
                        color: sbbrickRed,
                        onPressed: onRemove,
                      ),
                      Text(
                        '3',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_rounded),
                        color: sbbrickRed,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
