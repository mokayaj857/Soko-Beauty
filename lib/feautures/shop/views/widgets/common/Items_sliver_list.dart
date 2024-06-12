// import 'package:flutter/material.dart';
// import 'package:soko_beauty/feautures/shop/data/models/shop.dart';
// import 'package:soko_beauty/feautures/shop/views/widgets/cards_views/favorite.dart';
// import 'package:soko_beauty/feautures/shop/views/widgets/cards_views/for_you.dart';
// import 'package:soko_beauty/feautures/shop/views/widgets/cards_views/highly_rated.dart';
// import 'package:soko_beauty/feautures/shop/views/widgets/cards_views/luxurious.dart';
// import 'package:soko_beauty/feautures/shop/views/widgets/cards_views/new_shops.dart';
// import 'package:soko_beauty/feautures/shop/views/widgets/cards_views/new_to_you.dart';
// import 'package:soko_beauty/feautures/shop/views/widgets/cards_views/popular.dart';
// import 'package:soko_beauty/feautures/shop/views/widgets/cards_views/recent_cartegory.dart';
// import 'package:soko_beauty/feautures/shop/views/widgets/cards_views/trending.dart';
// import 'package:soko_beauty/feautures/shop/views/widgets/common/shop_list_title.dart';


// class ItemsSliverList extends StatelessWidget {
//   const ItemsSliverList({
//     super.key,
//     required this.shops,
//     required this.title,
//     required this.cardType,
//   });

//   final List<Shop> shops;
//   final String title;
//   final String cardType;

//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//       delegate: SliverChildBuilderDelegate(
//         (BuildContext context, int index) {
//           return Container(
//             padding: EdgeInsets.all(0),
//             height: 300,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Spacer(
//                   flex: 2,
//                 ),
//                 ShopListTitle(title: title),
//                 Spacer(
//                   flex: 2,
//                 ),
//                 Container(
//                   height: 250,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: shops.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       switch (cardType) {
//                         case 'favorite':
//                           return FavoriteShopsCard(
//                             shop: shops[index],
//                           );
//                         case 'highly_rated':
//                           return HighRatedShopsCard(
//                             shop: shops[index],
//                           );
//                         case 'for_you':
//                           return ShopsForYouCard(
//                             shop: shops[index],
//                           );
//                         case 'popular':
//                           return PopularShopsCard(
//                             shop: shops[index],
//                           );
//                         case 'new':
//                           return NewShopsCard(
//                             shop: shops[index],
//                           );
//                         case 'luxurious':
//                           return LuxuriousShopsCard(
//                             shop: shops[index],
//                           );
//                         case 'recent':
//                           return RecentCartegoryShopsCard(
//                             shop: shops[index],
//                           );
//                         case 'new_to_you':
//                           return NewToYouCard(
//                             shop: shops[index],
//                           );
//                         case 'trending':
//                           return TrendingShops(
//                             shop: shops[index],
//                           );
//                         default:
//                           return PopularShopsCard(
//                             shop: shops[index],
//                           );
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//         childCount: 1,
//       ),
//     );
//   }
// }
