import 'package:flutter/material.dart';
import 'package:soko_beauty/data/video/videos.dart';
import 'package:soko_beauty/widgets/video/player.dart';

class ProductsVideoTab extends StatefulWidget {
  @override
  State<ProductsVideoTab> createState() => _ProductsVideoTabState();
}

class _ProductsVideoTabState extends State<ProductsVideoTab> {
 
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: AlwaysScrollableScrollPhysics(),
      children: allVideos.map((video) {
        return VideoPlayerScreen(videoUrl: video['url']);
      }).toList(),
    );
  }
}
