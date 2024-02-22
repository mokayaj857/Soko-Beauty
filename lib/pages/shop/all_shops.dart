import 'package:flutter/material.dart';
import 'package:soko_beauty/models/dummy_data/products.dart';
import 'package:soko_beauty/models/dummy_data/shop.dart';
import 'package:soko_beauty/pages/shop/view_shop.dart';
import 'package:soko_beauty/widgets/shop/cards/favorite.dart';
import 'package:soko_beauty/widgets/shop/cards/for_you.dart';
import 'package:soko_beauty/widgets/shop/cards/highly_rated.dart';
import 'package:soko_beauty/widgets/shop/cards/luxurious.dart';
import 'package:soko_beauty/widgets/shop/cards/new_shops.dart';
import 'package:soko_beauty/widgets/shop/cards/new_to_you.dart';
import 'package:soko_beauty/widgets/shop/cards/popular.dart';
import 'package:soko_beauty/widgets/shop/cards/recent_cartegory.dart';
import 'package:soko_beauty/widgets/shop/cards/trending.dart';
import 'package:soko_beauty/widgets/shop/common/shop_list_title.dart';

class AllShopsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        ShopListTitle(title: "Favorite"),
        Container(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shops.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    //GO TO VIEW SHOP PAGE
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewShopPage(
                                shopName: shops[index].name,
                                shopDescription: shops[index].description,
                                products: products)));
                  },
                  child: FavoriteShopsCard(shop: shops[index]));
            },
          ),
        ),
        ShopListTitle(title: "For You"),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shops.length,
            itemBuilder: (context, index) {
              return ShopsForYouCard(shop: shops[index]);
            },
          ),
        ),
        ShopListTitle(title: "Highly Rated"),
        Container(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shops.length,
            itemBuilder: (context, index) {
              return HighRatedShopsCard(shop: shops[index]);
            },
          ),
        ),
        ShopListTitle(title: "Luxurious"),
        Container(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shops.length,
            itemBuilder: (context, index) {
              return LuxuriousShopsCard(shop: shops[index]);
            },
          ),
        ),
        ShopListTitle(title: "New Shops"),
        Container(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shops.length,
            itemBuilder: (context, index) {
              return NewShopsCard(shop: shops[index]);
            },
          ),
        ),
        ShopListTitle(title: "New to You"),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shops.length,
            itemBuilder: (context, index) {
              return NewToYouCard(shop: shops[index]);
            },
          ),
        ),
        ShopListTitle(title: "Popular"),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shops.length,
            itemBuilder: (context, index) {
              return PopularShopsCard(shop: shops[index]);
            },
          ),
        ),
        ShopListTitle(title: "Skin Care"),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shops.length,
            itemBuilder: (context, index) {
              return RecentCartegoryShopsCard(shop: shops[index]);
            },
          ),
        ),
        ShopListTitle(title: "Trending"),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shops.length,
            itemBuilder: (context, index) {
              return TrendingShops(shop: shops[index]);
            },
          ),
        ),
      ],
    );
  }
}
