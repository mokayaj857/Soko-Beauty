import 'package:soko_beauty/feautures/video/data/models/metrics.dart';
import 'package:soko_beauty/feautures/video/data/models/type.dart';

class Video {
  String id;
  String url;
  String publicId;
  VideoType videoType;
  String associatedItemId;
  VideoMetrics metrics;
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
    VideoMetrics? metrics,
    this.ownerId = '',
    this.tags = const [],
    this.description = '',
    required this.createdAt,
  }) : metrics = metrics ?? VideoMetrics.defaultMetrics(videoType);

  factory Video.fromMap(Map<String, dynamic> data, String id) {
    return Video(
      id: id,
      url: data['url'],
      publicId: data['publicId'] ?? '',
      videoType: VideoType.values[data['videoType']],
      associatedItemId: data['associatedItemId'] ?? '',
      metrics: VideoMetrics.fromMap(
          data['metrics'] ?? {}, VideoType.values[data['videoType']]),
      ownerId: data['ownerId'] ?? '',
      tags: List<String>.from(data['tags'] ?? []),
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
      'metrics': metrics.toMap(videoType),
      'ownerId': ownerId,
      'tags': tags,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
