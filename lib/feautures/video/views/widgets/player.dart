import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/shop/views/screens/cart/cart.dart';
import 'package:soko_beauty/feautures/video/views/widgets/comments.dart';
import 'package:soko_beauty/feautures/video/views/widgets/info.dart';
import 'package:soko_beauty/feautures/video/views/widgets/play_pause_icon.dart';
import 'package:soko_beauty/feautures/video/views/widgets/video_btn.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key, required this.videoInfo})
      : super(key: key);

  final Video videoInfo;

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
        FutureBuilder(
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
        Container(
          width: screenWidth,
          height: screenHeight,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
            child: Container(
              color: Theme.of(context).canvasColor.withOpacity(0.8),
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
        VideoActionButtons(
          onAddPressed: () {},
          onFavoritePressed: () {},
          onCommentPressed: () {
            setState(() {
              showComments = !showComments;
            });
          },
          shoppingCartPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()));
          },
          onSharePressed: () {},
        ),
        if (showComments) CommentSection(),
        VideoInfo(videoInfo: widget.videoInfo),
      ]),
    );
  }
}
