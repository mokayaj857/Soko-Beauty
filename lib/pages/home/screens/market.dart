import 'package:flutter/material.dart';
import 'package:soko_beauty/pages/shop/all_shops.dart';
import 'package:soko_beauty/widgets/shop/common/shops_appbar.dart';

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
