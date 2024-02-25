import 'package:flutter/material.dart';
import 'package:soko_beauty/data/video/videos.dart';
import 'package:soko_beauty/widgets/video/player.dart';

class AllVideosTab extends StatefulWidget {
  @override
  _AllVideosTabState createState() => _AllVideosTabState();
}

class _AllVideosTabState extends State<AllVideosTab> {
 
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
