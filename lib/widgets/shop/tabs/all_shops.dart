import 'package:flutter/material.dart';
import 'package:soko_beauty/widgets/shop/common/selection_chips.dart';
import 'package:soko_beauty/widgets/shop/common/shop_list_title.dart';
import 'package:soko_beauty/widgets/shop/for_you.dart';
import 'package:soko_beauty/widgets/shop/highly_rated.dart';
import 'package:soko_beauty/widgets/shop/new_arrivals.dart';

class AllShopsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        children: <Widget>[
         SelectionChips(),
          ShopListTitle(title: "For You"),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Number of restaurants
              itemBuilder: (context, index) {
                return ForYouCard();
              },
            ),
          ),
          ShopListTitle(title: "Highly Rated",),
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Number of dishes
              itemBuilder: (context, index) {
                return HighlyRated();
              },
            ),
          ),
          ShopListTitle(
            title: "New Arrivals",
          ),
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Number of dishes
              itemBuilder: (context, index) {
                return RestaurantCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}



