// import 'package:flutter/material.dart';
// import 'package:soko_beauty/feautures/shop/data/dummy/shop.dart';
// import 'package:soko_beauty/feautures/shop/views/screens/view_all.dart';

// class ShopListTitle extends StatelessWidget {
//   const ShopListTitle({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//       child: Row(
//         children: [
//           Text(title,
//               style: TextStyle(fontSize: 18, color: Theme.of(context).hintColor,fontWeight: FontWeight.bold)),
//           Spacer(),
//           GestureDetector(
//             onTap: () {
//               // Navigate to view all
//               //ViewAllShopsScreen();
//               Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllShopsScreen(shops: getShops())));
//             },
//             child: Text("View All",
//                 style: TextStyle(
//                   color: Colors.blue,
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }
