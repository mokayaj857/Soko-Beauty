import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/video/data/dummy/videos.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/views/widgets/player.dart';


class AllVideosTab extends StatefulWidget {
  @override
  _AllVideosTabState createState() => _AllVideosTabState();
}

class _AllVideosTabState extends State<AllVideosTab> {
  List<Video> allVideos = fetchDummyData();

  @override
  Widget build(BuildContext context) {
   return PageView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      children: allVideos.map((video) {
        Key key = Key('video_${video.id}');
        return VideoPlayerScreen(videoInfo: video, key: key);
      }).toList(),
    );
  }
}
