class Cart {
  List<CartItem> items;
  Cart({required this.items});
}

class CartItem {
  int productId;
  int quantity;

  CartItem({required this.productId, required this.quantity});
}
