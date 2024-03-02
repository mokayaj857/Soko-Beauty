import 'package:flutter/material.dart';
import 'package:soko_beauty/models/shop/Product.dart';
import 'package:soko_beauty/shop/screens/product/product_page.dart';
import 'package:soko_beauty/shop/widgets/common/product_appbar.dart';

class ViewShopPage extends StatelessWidget {
  final String shopName;
  final String shopDescription;
  final List<Product> products;

  ViewShopPage({
    required this.shopName,
    required this.shopDescription,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProductsAppbar(shopName: shopName, shopDescription: shopDescription),
          SliverFillRemaining(
            child:
          AllProductsView(),
          ),
        ],
      ),
    );
  }
}