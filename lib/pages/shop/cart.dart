import 'package:flutter/material.dart';
import 'package:soko_beauty/models/Product.dart';
import 'package:soko_beauty/pages/payment/payment.dart';
import 'package:soko_beauty/widgets/shop/cart/cart_item.dart';

final List<Product> cartProducts = [
  Product(
    id: '0',
    name: 'Lipstick',
    price: 20.0,
    imageUrl: 'https://picsum.photos/200/200',
  ),
  Product(
    id: '1',
    name: 'Lipstick',
    price: 20.0,
    imageUrl: 'https://picsum.photos/200/200',
  ),
  Product(
    id: '2',
    name: 'Eyeliner',
    price: 15.0,
    imageUrl: 'https://picsum.photos/200/200',
  ),
  Product(
    id: '3',
    name: 'Foundation',
    price: 25.0,
    imageUrl: 'https://picsum.photos/200/200',
  ),
  Product(
    id: '4',
    name: 'Mascara',
    price: 18.0,
    imageUrl: 'https://picsum.photos/200/200',
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
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                final product = cartProducts[index];
                return CartItem(
                  product: product,
                  onRemove: () => _removeProduct(index),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen())
                  );
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
