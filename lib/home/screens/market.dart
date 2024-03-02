import 'package:flutter/material.dart';
import 'package:soko_beauty/shop/screens/shops.dart';
import 'package:soko_beauty/models/shop/shop/common/shops_appbar.dart';

class MarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ShopsAppbar(),
          SliverList(delegate: SliverChildListDelegate([AllShopsView()]))
        ],
      ),
    );
  }
}
