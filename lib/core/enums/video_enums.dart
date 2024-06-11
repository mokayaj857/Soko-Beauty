enum MetricType {
  views,
  likes,
  reposts,
  comments,
  shares,
  purchases,
  bookings,
  cartAdditions,
  reviews,
}

extension MetricTypeExtension on MetricType {
  String get stringValue {
    switch (this) {
      case MetricType.views:
        return 'views';
      case MetricType.likes:
        return 'likes';
      case MetricType.reposts:
        return 'reposts';
      case MetricType.comments:
        return 'comments';
      case MetricType.shares:
        return 'shares';
      case MetricType.purchases:
        return 'purchases';
      case MetricType.bookings:
        return 'bookings';
      case MetricType.cartAdditions:
        return 'cartAdditions';
      case MetricType.reviews:
        return 'reviews';
    }
  }
}
