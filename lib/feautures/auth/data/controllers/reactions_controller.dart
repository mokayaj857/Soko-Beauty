import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soko_beauty/feautures/auth/data/models/reactions_model.dart';

class ReactionsController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add or update a reaction for a specific user and post
  Future<void> addOrUpdateReaction({
    required String userId,
    required String postId,
    bool? isLiked,
    bool? isSaved,
    int? sharesCount,
    int? watchTime,
    int? loops,
    bool? isBooked,
    bool? isPurchased,
    bool? isAddedToCart,
    bool? isWatched,
  }) async {
    final docRef = _firestore
        .collection('users')
        .doc(userId)
        .collection('reactions')
        .doc(postId);

    await docRef.set({
      if (isLiked != null) 'isLiked': isLiked,
      if (isSaved != null) 'isSaved': isSaved,
      if (sharesCount != null) 'sharesCount': FieldValue.increment(sharesCount),
      if (watchTime != null) 'watchTime': FieldValue.increment(watchTime),
      if (loops != null) 'loops': FieldValue.increment(loops),
      if (isBooked != null) 'isBooked': isBooked,
      if (isPurchased != null) 'isPurchased': isPurchased,
      if (isAddedToCart != null) 'isAddedToCart': isAddedToCart,
      if (isWatched != null) 'isWatched': isWatched,
      'reactedAt': Timestamp.now(),
    }, SetOptions(merge: true));
  }

  // Get reactions for a specific user and post
  Future<Reactions?> getReaction({
    required String userId,
    required String postId,
  }) async {
    final docSnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('reactions')
        .doc(postId)
        .get();
    if (docSnapshot.exists) {
      return Reactions.fromDocument(docSnapshot);
    } else {
      return null;
    }
  }

  // Delete a reaction for a specific user and post
  Future<void> deleteReaction({
    required String userId,
    required String postId,
  }) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('reactions')
        .doc(postId)
        .delete();
  }

  // Get reactions for a specific post across all users
  Future<Map<String, dynamic>> getVideoReactions({
    required String postId,
  }) async {
    final querySnapshot = await _firestore.collectionGroup('reactions')
      .where('postId', isEqualTo: postId)
      .get();

    int totalLikes = 0;
    int totalSaves = 0;
    int totalShares = 0;
    int totalWatchTime = 0;
    int totalLoops = 0;
    int totalBookings = 0;
    int totalPurchases = 0;
    int totalAddedToCart = 0;
    int totalWatched = 0;

    for (var doc in querySnapshot.docs) {
      final reaction = Reactions.fromDocument(doc);
      if (reaction.isLiked) totalLikes++;
      if (reaction.isSaved) totalSaves++;
      totalShares += reaction.sharesCount;
      totalWatchTime += reaction.watchTime;
      totalLoops += reaction.loops;
      if (reaction.isBooked) totalBookings++;
      if (reaction.isPurchased) totalPurchases++;
      if (reaction.isAddedToCart) totalAddedToCart++;
      if (reaction.isWatched) totalWatched++;
    }

    return {
      'totalLikes': totalLikes,
      'totalSaves': totalSaves,
      'totalShares': totalShares,
      'totalWatchTime': totalWatchTime,
      'totalLoops': totalLoops,
      'totalBookings': totalBookings,
      'totalPurchases': totalPurchases,
      'totalAddedToCart': totalAddedToCart,
      'totalWatched': totalWatched,
    };
  }

  // Get reactions for a specific post by a specific user
  Future<Reactions?> getCurrentUserReactionsOnVideo({
    required String userId,
    required String postId,
  }) async {
    final docSnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('reactions')
        .doc(postId)
        .get();
    if (docSnapshot.exists) {
      return Reactions.fromDocument(docSnapshot);
    } else {
      return null;
    }
  }
}
