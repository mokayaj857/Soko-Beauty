import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/video/data/dummy/videos.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/views/widgets/player.dart';

class ProductsVideoTab extends StatefulWidget {
  @override
  State<ProductsVideoTab> createState() => _ProductsVideoTabState();
}

class _ProductsVideoTabState extends State<ProductsVideoTab> {
  List<Video> allVideos = fetchDummyData(); // Change the type to List<Video>

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: AlwaysScrollableScrollPhysics(),
      children: allVideos.map((video) {
        return VideoPlayerScreen(
            videoInfo: video); // Pass the entire Video object
      }).toList(),
    );
  }
}
