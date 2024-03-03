// import 'package:flutter/material.dart';
// import 'package:soko_beauty/models/shop/Product.dart';


// class ViewAllProductsScreen extends StatelessWidget {
//   final List<Product> products;

//   ViewAllProductsScreen({required this.products});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('All Products in the shop'),
//         actions: [
//           //search icon btn
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.search),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 16,
//         ),
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//             maxCrossAxisExtent: 300,
//             mainAxisExtent: 300,
//             mainAxisSpacing: 16,
//             crossAxisSpacing: 16,
//           ),
//           itemCount: products.length,
//           itemBuilder: (context, index) {
//             return ProductsCard(product: products[index]);
//           },
//         ),
//       ),
//     );
//   }
// }

// class ProductsCard extends StatelessWidget {
//   final Product product;

//   ProductsCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 3,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//             child: Image.network(
//               product.imageUrl,
//               width: double.infinity,
//               height: 130,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   product.name,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   product.category,
//                   style: TextStyle(
//                     color: Colors.grey,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   product.description,
//                   style: TextStyle(
//                     fontSize: 14,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Icon(Icons.star, color: Colors.orange),
//                     SizedBox(width: 4),
//                     Text(
//                       product.rating.toString(),
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
