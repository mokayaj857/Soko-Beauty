import 'package:flutter/material.dart';
import 'package:soko_beauty/models/Product.dart';
import 'package:soko_beauty/pages/payment/payment.dart';
import 'package:soko_beauty/pages/shop/cart_archives.dart';
import 'package:soko_beauty/widgets/shop/cart/cart_item.dart';

final List<Product> cartProducts = [
  Product(
    id: '0',
    name: 'Lipstick',
    price: 20.0,
    imageUrl: 'https://picsum.photos/200/200/?random=4',
  ),
  Product(
    id: '1',
    name: 'Lipstick',
    price: 20.0,
    imageUrl: 'https://picsum.photos/200/200/?random=3',
  ),
  Product(
    id: '2',
    name: 'Eyeliner',
    price: 15.0,
    imageUrl: 'https://picsum.photos/200/200/?random=1',
  ),
  Product(
    id: '3',
    name: 'Foundation',
    price: 25.0,
    imageUrl: 'https://picsum.photos/200/200/?random=6',
  ),
  Product(
    id: '4',
    name: 'Mascara',
    price: 18.0,
    imageUrl: 'https://picsum.photos/200/200/?random=14',
  ),
  Product(
    id: '5',
    name: 'Eyeshadow Palette',
    price: 35.0,
    imageUrl: 'https://picsum.photos/200/200/?random=8',
  ),
  Product(
    id: '6',
    name: 'Blush',
    price: 15.0,
    imageUrl: 'https://picsum.photos/200/200/?random=0',
  ),
  Product(
    id: '7',
    name: 'Makeup Brush Set',
    price: 40.0,
    imageUrl: 'https://picsum.photos/200/200/?random=11',
  ),
  Product(
    id: '8',
    name: 'Lip Gloss',
    price: 12.0,
    imageUrl: 'https://picsum.photos/200/200/?random=12',
  ),
  Product(
    id: '9',
    name: 'Highlighter',
    price: 22.0,
    imageUrl: 'https://picsum.photos/200/200/?random=13',
  ),
  Product(
    id: '10',
    name: 'Compact Powder',
    price: 30.0,
    imageUrl: 'https://picsum.photos/200/200/?random=15',
  ),
];

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double getTotalPrice() {
    return cartProducts.fold(0, (total, current) => total + current.price);
  }

  // Example remove method (assuming one item at a time)
  void _removeProduct(int index) {
    setState(() {
      cartProducts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarTheme.color,
        title: Text('Cart'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartArchivesPage(
                            archivedProducts: cartProducts,
                          )));
            },
            icon: Icon(Icons.favorite_rounded),
          ),
        ],
      ),
      body: cartProducts.isEmpty
          ? Center(
              child: Text('Your Cart Is Empty.'),
            )
          : Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemExtent: 100,
                    itemCount: cartProducts.length,
                    itemBuilder: (context, index) {
                      final product = cartProducts[index];
                      return CartItem(
                        product: product,
                        onRemove: () => _removeProduct(index),
                        onAddPressed: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${getTotalPrice().toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentScreen()));
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
