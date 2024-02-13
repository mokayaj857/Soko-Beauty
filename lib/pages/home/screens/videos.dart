import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyWidget extends StatefulWidget {
  MyWidget({super.key});

  String VideoPath = 'assets/videos/vid1.mp4';
  


  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}