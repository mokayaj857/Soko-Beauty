import 'package:soko_beauty/feautures/video/data/models/comment.dart';
import 'package:soko_beauty/feautures/video/data/models/video_type.dart';

class Video {
  int id;
  String url;
  VideoType videoType; // enum  Service, Product, Review, None,
  int associatedItemId; // ID of the associated service, product, or review
  List<Comment> comments;
  List<String> likes; // List of user IDs who liked the video
  List<String> shares; // List of user IDs who shared the video
  int likeCount;
  int shareCount;
  String ownerId; 
  List<String> tags;
  String description;

  Video({
    required this.id,
    required this.url,
    required this.videoType,
    required this.associatedItemId,
    required this.comments,
    required this.likes,
    required this.shares,
    required this.likeCount,
    required this.shareCount,
    required this.ownerId,
    required this.tags,
    required this.description,
  });
}
