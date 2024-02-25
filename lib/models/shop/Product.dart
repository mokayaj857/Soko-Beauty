import 'package:soko_beauty/models/shop/review.dart';

class Product {
  final String id;
  final String name;
  String description;
  final double price;
  final String imageUrl;
  final double rating;
  int stockQuantity;
  final bool IsAvailable;
  final String category;
  List<String> videos; //videos id asociated with product
  List<String> images; //images url asociated with product
  List<Review> reviews; 
 

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.stockQuantity,
    required this.IsAvailable,
    required this.videos,
    required this.images,
    required this.reviews,
    required this.rating,
    required this.category,
    
    
  });
}






