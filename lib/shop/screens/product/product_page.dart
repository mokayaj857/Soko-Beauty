import 'package:flutter/material.dart';
import 'package:soko_beauty/models/data/shop/products.dart';
import 'package:soko_beauty/models/data/shop/shop.dart';
import 'package:soko_beauty/models/shop/shop.dart';
import 'package:soko_beauty/shop/widgets/cards/highly_rated.dart';
import 'package:soko_beauty/shop/widgets/cards/new_products.dart';
import 'package:soko_beauty/shop/widgets/cards/popular_products.dart';
import 'package:soko_beauty/shop/widgets/common/product_list_title.dart';

// ignore: must_be_immutable
class AllProductsView extends StatelessWidget {
  List<Shop> shops = getShops();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        ProductListTitle(title: "New Products"),
        Container(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  //GO TO VIEW SHOP PAGE
                },
                child: NewProductsCard(product: products[index]),
              );
            },
          ),
        ),
        ProductListTitle(title: "Popular"),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shops.length,
            itemBuilder: (context, index) {
              return PopularProducts(product: products[index]);
            },
          ),
        ),
        ProductListTitle(title: "Highly Rated"),
        Container(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shops.length,
            itemBuilder: (context, index) {
              return HighlyRatedProductsCard(product: products[index]);
            },
          ),
        ),
      ],
    );
  }
}
