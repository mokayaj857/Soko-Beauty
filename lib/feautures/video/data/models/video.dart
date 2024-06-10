import 'package:soko_beauty/feautures/video/data/models/video_type.dart';

class Video {
  String id;
  String url;
  String publicId;
  VideoType videoType;
  String associatedItemId;
  List<String> likes;
  List<String> shares;
  int likeCount;
  int shareCount;
  int viewCount;
  int commentCount;
  String ownerId;
  List<String> tags;
  String description;
  DateTime createdAt;

  Video({
    this.id = '',
    required this.url,
    this.publicId = '',
    required this.videoType,
    this.associatedItemId = '',
    this.likes = const [],
    this.shares = const [],
    this.likeCount = 0,
    this.shareCount = 0,
    this.commentCount = 0,
    this.viewCount = 0,
    this.ownerId = '',
    this.tags = const [],
    this.description = '',
    required this.createdAt,
  });

  factory Video.fromMap(Map<String, dynamic> data, String id) {
    print("the from map data is $data was called");
    print("the id is $id");
    return Video(
      id: id,
      url: data['url'],
      publicId: data['publicId'] ?? '',
      videoType: VideoType.values[data['videoType']],
      associatedItemId: data['associatedItemId'] ?? '',
      likes: List<String>.from(data['likes'] ?? []),
      shares: List<String>.from(data['shares'] ?? []),
      likeCount: data['likeCount'] ?? 0,
      shareCount: data['shareCount'] ?? 0,
      viewCount: data['viewCount'] ?? 0,
      commentCount: data['commentCount'] ?? 0,
      ownerId: data['ownerId'] ?? '',
      // tags: List<String>.from(data['tags'] ?? []),
      description: data['description'] ?? '',
      createdAt: DateTime.parse(data['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'publicId': publicId,
      'videoType': videoType.index,
      'associatedItemId': associatedItemId,
      'likes': likes,
      'shares': shares,
      'likeCount': likeCount,
      'shareCount': shareCount,
      'viewCount': viewCount,
      'commentCount': commentCount,
      'ownerId': ownerId,
      'tags': tags,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
