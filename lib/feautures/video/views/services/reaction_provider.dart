import 'package:flutter/material.dart';
import 'package:soko_beauty/core/enums/video_enums.dart';
import 'package:soko_beauty/feautures/auth/data/controllers/reaction_controller.dart';
import 'package:soko_beauty/feautures/auth/data/models/reaction_model.dart';
import 'package:soko_beauty/feautures/video/data/controllers/video_controller.dart';

class ReactionProvider with ChangeNotifier {
  final ReactionController _reactionController = ReactionController();
  final VideoController _videoController = VideoController();

  Future<void> toggleLike(String userId, String postId) async {
    final reaction =
        await _reactionController.getReaction(userId: userId, postId: postId);
    final isLiked = reaction?.isLiked ?? false;
    await _reactionController.addOrUpdateReaction(
        userId: userId, postId: postId, isLiked: !isLiked);
    if (!isLiked) {
      await _videoController.incrementMetric(postId, MetricType.likes);
    } else {
      await _videoController.decrementMetric(postId, MetricType.likes);
    }
    notifyListeners();
  }

  Future<void> toggleSave(String userId, String postId) async {
    final reaction =
        await _reactionController.getReaction(userId: userId, postId: postId);
    final isSaved = reaction?.isSaved ?? false;
    await _reactionController.addOrUpdateReaction(
        userId: userId, postId: postId, isSaved: !isSaved);
    notifyListeners();
  }

  Future<void> incrementShare(String userId, String postId) async {
    await _reactionController.addOrUpdateReaction(
        userId: userId, postId: postId, sharesCount: 1);
    await _videoController.incrementMetric(postId, MetricType.shares);
    notifyListeners();
  }

  Future<void> setWatched(String userId, String postId) async {
    await _reactionController.addOrUpdateReaction(
        userId: userId, postId: postId, isWatched: true);
    await _videoController.incrementMetric(postId, MetricType.views);
    notifyListeners();
  }

  Future<void> updateWatchMetrics(
      String userId, String postId, int watchTime, int loops) async {
    await _reactionController.addOrUpdateReaction(
        userId: userId, postId: postId, watchTime: watchTime, loops: loops);
    notifyListeners();
  }

  Future<void> toggleBooked(String userId, String postId) async {
    final reaction =
        await _reactionController.getReaction(userId: userId, postId: postId);
    final isBooked = reaction?.isBooked ?? false;
    await _reactionController.addOrUpdateReaction(
        userId: userId, postId: postId, isBooked: !isBooked);
    _videoController.incrementMetric(postId, MetricType.bookings);
    notifyListeners();
  }

  Future<void> togglePurchased(String userId, String postId) async {
    final reaction =
        await _reactionController.getReaction(userId: userId, postId: postId);
    final isPurchased = reaction?.isPurchased ?? false;
    await _reactionController.addOrUpdateReaction(
        userId: userId, postId: postId, isPurchased: !isPurchased);
    await _videoController.incrementMetric(postId, MetricType.purchases);
    notifyListeners();
  }

  Future<void> toggleAddedToCart(String userId, String postId) async {
    final reaction =
        await _reactionController.getReaction(userId: userId, postId: postId);
    final isAddedToCart = reaction?.isAddedToCart ?? false;
    await _reactionController.addOrUpdateReaction(
        userId: userId, postId: postId, isAddedToCart: !isAddedToCart);
    await _videoController.incrementMetric(postId, MetricType.cartAdditions);
    notifyListeners();
  }

  Stream<Reaction?> getCurrentUserReactionOnVideo(
      String userId, String postId) {
    return _reactionController.getReaction(userId: userId, postId: postId)
        .asStream();
  }
}
