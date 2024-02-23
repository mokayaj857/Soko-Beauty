import 'package:soko_beauty/models/shop/payment.dart';
import 'package:soko_beauty/models/shop/product.dart';
import 'package:soko_beauty/models/shop/service.dart';

class Shop {
  final String id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final double rating;
  final bool isOpen;
  String location;
  List<Map> openHours;
  List<Product> products;
  List<Service> services;
  List<PaymentDetails> payment;

  Shop({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.isOpen,
    required this.openHours,
    required this.location,
    required this.products,
    required this.services,
    required this.payment,
  });
}
