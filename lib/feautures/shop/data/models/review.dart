class Review {
  String userId;
  String comment;
  int rating;
  String video; //video id asociated with review
  List<String> images; //review images url
  String vendorReply;
  Review({
    required this.userId,
    required this.comment,
    required this.rating,
    required this.video,
    required this.images,
    required this.vendorReply,
  });
}
