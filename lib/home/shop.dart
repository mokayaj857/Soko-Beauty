import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/shop/views/widgets/common/shops_appbar.dart';

class MarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ShopsAppbar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(0),
                  child: Center(
                    child: Text(
                      'Shops page comming soon...',
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
