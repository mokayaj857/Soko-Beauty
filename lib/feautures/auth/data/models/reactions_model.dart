import 'package:cloud_firestore/cloud_firestore.dart';

class Reactions {
  final String postId;
  bool isLiked;
  bool isSaved;
  int sharesCount;
  DateTime reactedAt;
  int watchTime;
  int loops;
  bool isBooked;
  bool isPurchased;
  bool isAddedToCart;
  bool isWatched;

  Reactions({
    required this.postId,
    this.isLiked = false,
    this.isSaved = false,
    this.sharesCount = 0,
    required this.reactedAt,
    this.watchTime = 0,
    this.loops = 0,
    this.isBooked = false,
    this.isPurchased = false,
    this.isAddedToCart = false,
    this.isWatched = false,
  });

  factory Reactions.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Reactions(
      postId: doc.id,
      isLiked: data['isLiked'] ?? false,
      isSaved: data['isSaved'] ?? false,
      sharesCount: data['sharesCount'] ?? 0,
      reactedAt: (data['reactedAt'] as Timestamp).toDate(),
      watchTime: data['watchTime'] ?? 0,

      loops: data['loops'] ?? 0,
      isBooked: data['isBooked'] ?? false,
      isPurchased: data['isPurchased'] ?? false,
      isAddedToCart: data['isAddedToCart'] ?? false,
      isWatched: data['isWatched'] ?? false,
      
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLiked': isLiked,
      'isSaved': isSaved,
      'sharesCount': sharesCount,
      'reactedAt': reactedAt,
      'watchTime': watchTime,
      'loops': loops,
      'isBooked': isBooked,
      'isPurchased': isPurchased,
      'isAddedToCart': isAddedToCart,
      'isWatched': isWatched,
    };
  }
}
