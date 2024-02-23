import 'dart:io';
import 'package:flutter/material.dart';
import 'package:soko_beauty/theme/colors/colors.dart';
import 'package:video_player/video_player.dart';

class RecordedVideoPage extends StatefulWidget {
  const RecordedVideoPage({super.key, required this.videoFile});
  final File videoFile;

  @override
  State<RecordedVideoPage> createState() => _RecordedVideoPageState();
}

class _RecordedVideoPageState extends State<RecordedVideoPage> {
  late VideoPlayerController _videoController;
  bool _isPlaying = false;
  double _currentSliderValue = 0.0;
  @override
  void initState() {
    _videoController = VideoPlayerController.file(widget.videoFile);
    initializeVideo();
    super.initState();
    _videoController.addListener(() {
      setState(() {
        _currentSliderValue =
            _videoController.value.position.inSeconds.toDouble();
      });
    });
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.2),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Colors.white),
        ),
        actions: [
          //5 video editing Icons
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.crop, size: 30, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.text_fields, size: 30, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.music_note, size: 30, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.emoji_emotions, size: 30, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check, color: Colors.white),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Transform.scale(
                  scale: 1.1,
                  child: AspectRatio(
                    aspectRatio: 9 / 16,
                    child: VideoPlayer(_videoController),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(0),
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Slider(
                    thumbColor: sbbrickRed,
                    activeColor: sbbrickRed,
                    value: _currentSliderValue,
                    onChanged: (value) {
                      setState(() {
                        _currentSliderValue = value;
                        _videoController
                            .seekTo(Duration(seconds: value.toInt()));
                      });
                    },
                    min: 0,
                    max: _videoController.value.duration.inSeconds.toDouble(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                        onPressed: () {
                          setState(() {
                            _isPlaying
                                ? _videoController.pause()
                                : _videoController.play();
                            _isPlaying = !_isPlaying;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
