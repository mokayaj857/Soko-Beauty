import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soko_beauty/core/constants/cloudinary_constants.dart';
import 'package:soko_beauty/config/styles/video_styles.dart';
import 'package:video_player/video_player.dart';
import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:cloudinary_flutter/video/cld_video_controller.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';

class Player extends StatefulWidget {
  const Player({
    Key? key,
    required this.videoUrl,
    required this.publicId,
  }) : super(key: key);

  final String videoUrl;
  final String publicId;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late CldVideoController _controller;
  Cloudinary cloudinary = CloudinaryObject.fromCloudName(cloudName: cloudName);
  bool showIcon = false;

  @override
  void initState() {
    super.initState();
    _controller =
        CldVideoController(cloudinary: cloudinary, publicId: widget.publicId);
    // ..initialize().then((_) {
    //   setState(() {});
    // });
    _controller.play();
    _controller.setLooping(true);
  }

  void startTimer() {
    // Wait for two seconds and then hide the icon
    Future.delayed(Duration(seconds: 2), () {
      if (_controller.value.isPlaying)
        setState(() {
          showIcon = false;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: VideoItemPosition.player.top,
      bottom: VideoItemPosition.player.bottom,
      left: VideoItemPosition.player.left,
      right: VideoItemPosition.player.right,
      child: Stack(children: [
        Positioned.fill(
          child: FutureBuilder(
            future: _controller.initialize(),
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
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              color: Colors.black.withOpacity(0.85),
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
                future: _controller.initialize(),
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
            child: Icon(
              CupertinoIcons.play_fill,
              color: Colors.white.withOpacity(0.7),
              size: 100,
            ),
          ),
        Positioned(
          child: VideoProgressIndicator(
            _controller,
            allowScrubbing: true,
            colors: VideoProgressColors(
              playedColor: Colors.red.withOpacity(0.7),
              bufferedColor: Colors.white.withOpacity(0.0),
              backgroundColor: Colors.grey.withOpacity(0.4),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
