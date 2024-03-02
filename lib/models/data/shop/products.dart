import 'package:soko_beauty/models/shop/Product.dart';

final List<Product> products = [
  Product(
    id: '1',
    name: 'Product 1',
    description: 'Description 1',
    price: 10.0,
    imageUrl: 'https://picsum.photos/id/1015/300/201',
    stockQuantity: 10,
    IsAvailable: true,
    videos: [],
    images: [],
    reviews: [],
    rating: 4.5,
    category: 'Category 1',
  ),
  Product(
    id: '2',
    name: 'Product 2',
    description: 'Description 2',
    price: 20.0,
    imageUrl: 'https://picsum.photos/id/1016/300/202',
    stockQuantity: 20,
    IsAvailable: false,
    videos: [],
    images: [],
    reviews: [],
    rating: 3.5,
    category: 'Category 2',
  ),
  // Add more products here...
];
 

