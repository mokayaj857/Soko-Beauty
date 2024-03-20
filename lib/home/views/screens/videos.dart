import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/video/views/screens/video_tabbar.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return VideoTabBar();
  }
}
