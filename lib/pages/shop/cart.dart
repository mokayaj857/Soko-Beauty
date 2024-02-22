import 'package:flutter/material.dart';
import 'package:soko_beauty/models/dummy_data/cart.dart';
import 'package:soko_beauty/pages/payment/payment.dart';
import 'package:soko_beauty/pages/shop/cart_archives.dart';
import 'package:soko_beauty/widgets/shop/cart/cart_item.dart';


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
