// import 'package:flutter/material.dart';
// import 'package:soko_beauty/feautures/shop/views/screens/cart/cart_archives.dart';
// import 'package:soko_beauty/feautures/shop/views/screens/payment/payment.dart';
// import 'package:soko_beauty/feautures/shop/views/widgets/cart/cart_item.dart';

// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   double getTotalPrice() {
//     return cartProducts.fold(0, (total, current) => total + current.price);
//   }

//   // Example remove method (assuming one item at a time)
//   void _removeProduct(int index) {
//     setState(() {
//       cartProducts.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios_sharp),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         backgroundColor:
//             Theme.of(context).bottomAppBarTheme.color?.withOpacity(0.5),
//         title: Text('Cart'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => CartArchivesPage(
//                             archivedProducts: cartProducts,
//                           )));
//             },
//             icon: Icon(Icons.favorite_rounded),
//           ),
//         ],
//       ),
//       body: cartProducts.isEmpty
//           ? Center(
//               child: Text('Your Cart Is Empty.'),
//             )
//           : Expanded(
//               child: ListView.builder(
//                 itemExtent: 150,
//                 itemCount: cartProducts.length,
//                 itemBuilder: (context, index) {
//                   final product = cartProducts[index];
//                   return CartItem(
//                     product: product,
//                     onRemove: () => _removeProduct(index),
//                     onAddPressed: () {},
//                   );
//                 },
//               ),
//             ),
//       bottomNavigationBar: BottomAppBar(
//         color: Theme.of(context).scaffoldBackgroundColor,
//         height: 80,
//         elevation: 0,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Total: \$${getTotalPrice().toStringAsFixed(2)}',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               //create a beautiful button
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => PaymentScreen(),
//                     ),
//                   );
//                 },
//                 child: Text('Checkout'),
//                 style: ButtonStyle(
//                   backgroundColor:
//                       WidgetStateProperty.all(Theme.of(context).primaryColor),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
