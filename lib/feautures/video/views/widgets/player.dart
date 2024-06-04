import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/views/widgets/info.dart';
import 'package:soko_beauty/feautures/video/views/widgets/play_pause_icon.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen(
      {Key? key, required this.videoInfo, required this.videoActions})
      : super(key: key);

  final Video videoInfo;
  final Widget videoActions;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late bool showIcon;
  bool isLoading = true;
  bool showComments = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        widget.videoInfo.url,
      ),
    );
    _initializeVideoPlayerFuture = _controller.initialize();

    // Auto-play after initialization
    _controller.play();
    showIcon = false;

    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startTimer() {
    // Wait for two seconds and then update then hide the icon
    Future.delayed(Duration(seconds: 2), () {
      if (_controller.value.isPlaying)
        setState(() {
          showIcon = false;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double aspectRatio = screenWidth / screenHeight;

    return Scaffold(
      body: Stack(children: [
        Positioned(
          bottom: 50,
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: aspectRatio,
                  child: VideoPlayer(_controller),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        Container(
          width: screenWidth,
          height: screenHeight,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: .01, sigmaY: .01),
            child: Container(
              color: Colors.black.withOpacity(0.95),
            ),
          ),
        ),
        InteractiveViewer(
          child: GestureDetector(
            onTap: () {
              // Toggle play/pause on tap inside the video area
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
                showIcon = true;
                startTimer();
              });
            },
            child: Center(
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ),
        if (showIcon)
          Center(
            child: AnimatedPlayPauseIcon(
              playState: _controller.value.isPlaying,
            ),
          ),
        // Video actions
        Positioned(bottom: 50, right: 0, child: widget.videoActions),

        // video in such as description,
        Positioned(bottom: 80, child: VideoInfo(videoInfo: widget.videoInfo)),

        // video audio data such as song name and artist
        Positioned(
          bottom: 50,
          right: 0,
          left: 0,
          child: Container(
            width: screenWidth,
            // height: 30,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              border: Border(
                top: BorderSide(
                  color: Colors.red.withOpacity(0.25),
                  width: 0.7,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.75, vertical: 1.75),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.white.withOpacity(0.35), width: 3),
                    ),
                    child: Icon(
                      Icons.music_note,
                      color: Colors.white.withOpacity(0.9),
                      size: 16,
                    )),
                SizedBox(width: 4),
                Text(
                  "Beauty by Godfrey Williams",
                  style: TextStyle(
                      fontSize: 13, color: Colors.white.withOpacity(0.9)),
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    // color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(20),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black.withOpacity(0.2),
                    //     blurRadius: 5,
                    //     spreadRadius: 0.5,
                    //   )
                    // ],
                    gradient: LinearGradient(
                      colors: [
                        Colors.red.withOpacity(0.4),
                        Colors.blue.withOpacity(0.4),
                      ],
                    ),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.35), width: 0.03),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.videocam,
                        color: Colors.white.withOpacity(0.9),
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "use this sound",
                        style: TextStyle(
                            fontSize: 11, color: Colors.white.withOpacity(0.9)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
