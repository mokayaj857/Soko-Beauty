import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';
import 'package:soko_beauty/models/Product.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final VoidCallback onRemove;

  const CartItem({
    required this.product,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          product.imageUrl,

          width: 100,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        product.name,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: sbbrickRed,
        ),
      ),
      subtitle: Text(
        '500 ml 2pcs',
        style: TextStyle(
          fontSize: 16,
          color: sbwarmRed,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: onRemove,
          ),
          Text('\$${product.price.toStringAsFixed(2)}'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
