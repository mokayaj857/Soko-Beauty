import 'package:flutter/material.dart';
import 'package:soko_beauty/models/Product.dart';
import 'package:soko_beauty/widgets/shop/cart/cart_fav_item.dart';

class CartArchivesPage extends StatelessWidget {
  final List<Product> archivedProducts; // List of archived products

  CartArchivesPage({required this.archivedProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Items'),
      ),
      body: archivedProducts.isEmpty
          ? Center(
              child: Text('No Favorite Items.'),
            )
          : ListView.builder(
              itemCount: archivedProducts.length,
              itemBuilder: (context, index) {
                final archivedProduct = archivedProducts[index];
                return CartFavoriteItem(
                  product: archivedProduct,
                  onRemove: () {
                    // Handle remove from archived list if needed
                  },
                  onAddPressed: () {
                    // Handle add back to the cart or any other action
                  },
                );
              },
            ),
    );
  }
}
