import 'package:flutter/material.dart';
import 'package:soko_beauty/core/enums/video_enums.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/data/models/type.dart';
import 'package:soko_beauty/feautures/video/data/controllers/video_controller.dart';

class VideoProvider with ChangeNotifier {
  final VideoController _videoController = VideoController();
  List<Video> _videos = [];
  Video? _currentVideo;
  int _currentPage = 1;
  bool _isLoading = false;

  List<Video> get videos => _videos;
  Video? get currentVideo => _currentVideo;
  bool get isLoading => _isLoading;

  Future<Video> createVideo(Video video) async {
    Video newVideo = await _videoController.createVideo(video);
    _videos.add(video);
    notifyListeners();
    return newVideo;
  }

  Future<void> updateVideo(String id, Video video) async {
    await _videoController.updateVideo(id, video);
    int index = _videos.indexWhere((v) => v.id == id);
    if (index != -1) {
      _videos[index] = video;
      notifyListeners();
    }
  }

  Future<void> viewVideo(String id) async {
    _currentVideo = await _videoController.viewVideo(id);
    notifyListeners();
  }

  Future<void> deleteVideo(String id) async {
    await _videoController.deleteVideo(id);
    _videos.removeWhere((video) => video.id == id);
    notifyListeners();
  }

  Future<void> searchVideos(
      {String? tag, String? description, String? ownerId}) async {
    _videos = await _videoController.searchVideos(
      tag: tag,
      description: description,
      ownerId: ownerId,
    );
    notifyListeners();
  }

  Future<List<Video>> getVideosByType(VideoType type) async {
    if (_isLoading) {
      return []; // Return an empty list while loading
    }

    _isLoading = true; // Set loading flag to true
    try {
      final List<Video> fetchedVideos =
          await _videoController.getVideosByType(type);
      _videos = fetchedVideos; // Update the _videos list with fetched videos
      return fetchedVideos;
    } catch (error) {
      // Handle error
      print('Error fetching videos by type: $error');
      throw error; // Rethrow the error
    } finally {
      _isLoading = false; // Set loading flag to false when done
      notifyListeners(); // Notify listeners after setting loading flag
    }
  }

  Future<List<Video>> getAllVideos() async {
    print('Getting all videos');
    if (!_isLoading) {
      _isLoading = true;
      try {
        final List<Video> fetchedVideos =
            await _videoController.getAllVideos(page: _currentPage, limit: 50);
        _videos.addAll(fetchedVideos);
        _currentPage++;
        print('Fetched videos: ${fetchedVideos.length}');
        print('Total videos: ${_videos.length}');
        return _videos; // Return fetched videos
      } catch (error) {
        // Handle error
        print('Error fetching videos: $error');
        throw error; // Rethrow the error
      } finally {
        _isLoading = false;
        notifyListeners();
      }
    }
    return _videos; // Return current videos if already loading
  }

  // New method to increment a metric for a video
  Future<void> incrementMetric(String videoId, MetricType metricField) async {
    await _videoController.incrementMetric(videoId, metricField);
    // You may want to update the current video's metrics here
    // For example:
    // if (_currentVideo?.id == videoId) {
    //   _currentVideo = await _videoController.viewVideo(videoId);
    //   notifyListeners();
    // }
  }

  // New method to decrement a metric for a video
  Future<void> decrementMetric(String videoId, MetricType metricField) async {
    await _videoController.decrementMetric(videoId, metricField);
    // You may want to update the current video's metrics here
    // For example:
    // if (_currentVideo?.id == videoId) {
    //   _currentVideo = await _videoController.viewVideo(videoId);
    //   notifyListeners();
    // }
  }
}
