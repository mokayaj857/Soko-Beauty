
class Shop {
  final String id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final double rating;
  final bool isOpen;
  final String location;
  final List<Map> openHours;

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
  });

  // Convert a Shop object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'rating': rating,
      'isOpen': isOpen,
      'location': location,
      'openHours': openHours,
    };
  }

  // Extract a Shop object from a Map object
  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      rating: map['rating'],
      isOpen: map['isOpen'],
      location: map['location'],
      openHours: List<Map>.from(map['openHours']),
    );
  }
}
