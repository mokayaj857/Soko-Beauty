import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class RecordedVideoPage extends StatefulWidget {
  const RecordedVideoPage({super.key, required this.videoFile});
  final File videoFile;

  @override
  State<RecordedVideoPage> createState() => _RecordedVideoPageState();
}

class _RecordedVideoPageState extends State<RecordedVideoPage> {
  late VideoPlayerController _videoController;
  @override
  void initState() {
    _videoController = VideoPlayerController.file(widget.videoFile);
    initializeVideo();
    super.initState();
  }

  void initializeVideo() async {
    await _videoController.initialize();
    _videoController.setLooping(true);
    _videoController.play();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video 😍"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 1.1,
            child: Flexible(
              child: AspectRatio(
                aspectRatio: 9 / 16,
                child: Container(
                  color: Colors.black,
                  child: VideoPlayer(_videoController),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
