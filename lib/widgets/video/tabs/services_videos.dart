import 'package:flutter/material.dart';
import 'package:soko_beauty/data/video/videos.dart';
import 'package:soko_beauty/widgets/video/player.dart';

class ServicesVideosTab extends StatefulWidget {
  @override
  _ServicesVideosTabState createState() => _ServicesVideosTabState();
}

class _ServicesVideosTabState extends State<ServicesVideosTab> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      children: allVideos.map((video) {
        return VideoPlayerScreen(videoUrl: video['url']);
      }).toList(),
    );
  }
}
