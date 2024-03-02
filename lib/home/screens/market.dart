import 'package:flutter/material.dart';
import 'package:soko_beauty/shop/product/all_shops.dart';
import 'package:soko_beauty/models/shop/shop/common/shops_appbar.dart';

class MarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ShopsAppbar(),
          SliverFillRemaining(
            child:
          AllShopsView(),
          ),
        ],
      ),
    );
  }
}
