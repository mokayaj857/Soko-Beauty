import 'package:flutter/material.dart';
import 'package:soko_beauty/widgets/video/player.dart';

class FollowingVideosTab extends StatefulWidget {
  @override
  _FollowingVideosTabState createState() => _FollowingVideosTabState();
}

class _FollowingVideosTabState extends State<FollowingVideosTab> {
  final List<Map<String, dynamic>> apiVideos = [
    {
      "url":
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    },
    {
      "url":
          "https://player.vimeo.com/external/296210754.hd.mp4?s=08c03c14c04f15d65901f25b542eb2305090a3d7&profile_id=175&oauth2_token_id=57447761",
    },
    {
      "url":
          "https://player.vimeo.com/external/459389137.hd.mp4?s=964e360f6996936b708905b2fcf9bdd66c26de0d&profile_id=170&oauth2_token_id=57447761",
    },
    {
      "url":
          "https://player.vimeo.com/external/517090081.hd.mp4?s=41698e1dec8310a33d49620e58eacab0589913da&profile_id=169&oauth2_token_id=57447761",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      children: apiVideos.map((video) {
        return VideoPlayerScreen(videoUrl: video['url']);
      }).toList(),
    );
  }
}
