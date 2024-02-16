import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VideoProvider with ChangeNotifier {
  List<String> _videosUrlList = [];
  final int numberOfVideos;

  VideoProvider({required this.numberOfVideos});

  List<String> get videosUrlList => _videosUrlList;

  Future<void> fetchVideos() async {
    final response = await http.get(
      Uri.parse(
          'https://api.pexels.com/videos/search?query=fashion&per_page=$numberOfVideos'),
      headers: {
        'Authorization':
            'i85gLNwd7weAX5PaWUfFessA11GscNCMOUO0vDRl3rTKCi8OnXqkdSdF'
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);
      final List<dynamic> videos = decodedData['videos'];

      _videosUrlList = videos.map<String>((dynamic video) {
        // Assuming you want the first HD video link
        final List<dynamic> videoFiles = video['video_files'];
        final dynamic hdVideo = videoFiles.firstWhere(
          (file) => file['quality'] == 'hd',
          orElse: () => videoFiles
              .first, // Fallback to the first video if HD is not found
        );
        return hdVideo['link'];
      }).toList();

      notifyListeners();
    } else {
      throw Exception('Failed to load videos');
    }
  }

  // Method to reset the list of videos
  void resetVideos() {
    _videosUrlList.clear();
    notifyListeners();
  }
}
