class Order {
  int orderId;
  int userId;
  List<OrderItem> items;
  double totalAmount;
  DateTime orderDate;

  Order({
    required this.orderId,
    required this.userId,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
  });
}

class OrderItem {
  int productId;
  int quantity;

  OrderItem({
    required this.productId,
    required this.quantity,
  });
}
