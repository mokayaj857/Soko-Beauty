import 'package:soko_beauty/feautures/video/data/models/type.dart';

class VideoMetrics {
  final int views;
  final int likes;
  final int reposts;
  final int comments;
  final int shares;
  final int? purchases;
  final int? bookings;
  final int? cartAdditions;
  final int? reviews;

  VideoMetrics({
    required this.views,
    required this.likes,
    required this.reposts,
    required this.comments,
    required this.shares,
    this.purchases,
    this.bookings,
    this.cartAdditions,
    this.reviews,
  });

  factory VideoMetrics.fromMap(Map<String, dynamic> map, VideoType videoType) {
    return VideoMetrics(
      views: map['views'] ?? 0,
      likes: map['likes'] ?? 0,
      reposts: map['reposts'] ?? 0,
      comments: map['comments'] ?? 0,
      shares: map['shares'] ?? 0,
      purchases: videoType == VideoType.Product ? map['purchases'] ?? 0 : null,
      bookings: videoType == VideoType.Service ? map['bookings'] ?? 0 : null,
      cartAdditions:
          videoType == VideoType.Product ? map['cartAdditions'] ?? 0 : null,
      reviews: (videoType == VideoType.Product || videoType == VideoType.Review)
          ? map['reviews'] ?? 0
          : null,
    );
  }

  static VideoMetrics defaultMetrics(VideoType videoType) {
    return VideoMetrics(
      views: 0,
      likes: 0,
      reposts: 0,
      comments: 0,
      shares: 0,
      purchases: videoType == VideoType.Product ? 0 : null,
      bookings: videoType == VideoType.Service ? 0 : null,
      cartAdditions: videoType == VideoType.Product ? 0 : null,
      reviews: (videoType == VideoType.Product || videoType == VideoType.Review)
          ? 0
          : null,
    );
  }

  Map<String, dynamic> toMap(VideoType videoType) {
    final map = {
      'views': views,
      'likes': likes,
      'reposts': reposts,
      'comments': comments,
      'shares': shares,
    };

    if (videoType == VideoType.Service) {
      map['bookings'] = bookings ?? 0;
      map['reviews'] = reviews ?? 0;
    } else if (videoType == VideoType.Product) {
      map['purchases'] = purchases ?? 0;
      map['cartAdditions'] = cartAdditions ?? 0;
      map['reviews'] = reviews ?? 0;
    }

    return map;
  }
}
