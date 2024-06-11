import 'package:soko_beauty/core/enums/video_enums.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/data/models/type.dart';
import 'package:soko_beauty/feautures/video/data/repositories/video_repo.dart';

class VideoController {
  final VideoRepository _videoRepository = VideoRepository();

  Future<Video> createVideo(Video video) async {
    return await _videoRepository.addVideo(video);
  }

  Future<void> updateVideo(String id, Video video) async {
    await _videoRepository.updateVideo(id, video);
  }

  Future<Video> viewVideo(String id) async {
    return await _videoRepository.getVideo(id);
  }

  Future<void> deleteVideo(String id) async {
    await _videoRepository.deleteVideo(id);
  }

  Future<List<Video>> searchVideos({
    String? tag,
    String? description,
    String? ownerId,
  }) async {
    return await _videoRepository.searchVideos(
      tag: tag,
      description: description,
      ownerId: ownerId,
    );
  }

  Future<List<Video>> getVideosByType(VideoType type) async {
    return await _videoRepository.getVideosByType(type);
  }

  Future<List<Video>> getAllVideos({int limit = 50, int page = 1}) async {
    return await _videoRepository.getAllVideos(limit: limit, page: page);
  }

  // New method to increment a metric for a video
  Future<void> incrementMetric(String videoId, MetricType metricField) async {
    await _videoRepository.incrementMetric(videoId, metricField);
  }

  // New method to decrement a metric for a video
  Future<void> decrementMetric(String videoId, MetricType metricField) async {
    await _videoRepository.decrementMetric(videoId, metricField);
  }
}
