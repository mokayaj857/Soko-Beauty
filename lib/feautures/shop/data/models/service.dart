import 'package:soko_beauty/feautures/shop/data/models/review.dart';

class Service {
  int id;
  String name;
  String description;
  double price;
  List<String> videos; // videos id associated with service
  List<String> images; //images urls associated with service
  List<Review> reviews;

  Service({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.videos,
    required this.images,
    required this.reviews,
  });
}
