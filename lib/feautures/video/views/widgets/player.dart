import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soko_beauty/config/colors/global_colors.dart';
import 'package:soko_beauty/core/constants/cloudinary_constants.dart';
import 'package:soko_beauty/config/styles/video_styles.dart';
import 'package:soko_beauty/core/views/widgets/loading.dart';
import 'package:video_player/video_player.dart';
import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:cloudinary_flutter/video/cld_video_controller.dart';
// import 'package:cloudinary_url_gen/transformation/transformation.dart';
// import 'package:cloudinary_url_gen/transformation/delivery/delivery.dart';
// import 'package:cloudinary_url_gen/transformation/resize/resize.dart';
// import 'package:cloudinary_url_gen/transformation/delivery/delivery_actions.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';

class Player extends StatefulWidget {
  const Player({
    Key? key,
    required this.videoUrl,
    required this.publicId,
    required this.onWatched,
    required this.onEnded,
  }) : super(key: key);

  final String videoUrl;
  final String publicId;
  final VoidCallback onWatched;
  final Function(int, int, int) onEnded;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> with WidgetsBindingObserver {
  late CldVideoController _controller;
  Cloudinary cloudinary = CloudinaryObject.fromCloudName(
    cloudName: cloudName,
  );

  bool showIcon = false;
  late Future<void> _initializeVideoPlayerFuture;
  late Timer _watchTimer;
  int _totalWatchedSeconds = 0;
  int _totalLoopsWatched = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _controller = CldVideoController(
      cloudinary: cloudinary,
      publicId: widget.publicId,
      // transformation: Transformation()
      // .resize(
      //   Resize.scale().width(500).height(900),
      // )
      // .delivery(Delivery.format(Format.auto))
    );
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {
        _controller.play();
        widget.onWatched();
        _controller.setLooping(true);
      });
    });

    //   transformation: Transformation()
    // .resize(Resize.scale().width(
    //   MediaQuery.of(context).size.width.toInt())
    // )
    // .delivery(Delivery.format(
    // Format.auto:video()))
    // .setAssetType("video")

    // Start timer to track video watch time
    _watchTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_controller.value.isPlaying) {
        setState(() {
          _totalWatchedSeconds++;
        });
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      _controller.pause();
    }
  }

  void startTimer() {
    Future.delayed(Duration(milliseconds: 200), () {
      if (_controller.value.isPlaying) {
        setState(() {
          showIcon = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: VideoItemPosition.player.top,
      bottom: VideoItemPosition.player.bottom,
      left: VideoItemPosition.player.left,
      right: VideoItemPosition.player.right,
      child: Stack(
        children: [
          Positioned.fill(
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                } else {
                  return const Center();
                }
              },
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(
                color: Colors.black.withOpacity(0.75),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
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
            child: InteractiveViewer(
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
                      return LoadingWidget(color: AppColors.primary);
                    }
                  },
                ),
              ),
            ),
          ),
          if (showIcon)
            GestureDetector(
              onTap: () {
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
                child: Icon(
                  CupertinoIcons.play_fill,
                  color: Colors.white.withOpacity(0.7),
                  size: 50,
                ),
              ),
            ),
          Positioned(
            bottom: VideoItemPosition.playerProgress.bottom,
            left: VideoItemPosition.playerProgress.left,
            right: VideoItemPosition.playerProgress.right,
            child: VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
              colors: VideoProgressColors(
                playedColor: AppColors.primary.withOpacity(0.7),
                bufferedColor: Colors.white.withOpacity(0.0),
                backgroundColor: Colors.grey.withOpacity(0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    widget.onEnded(_controller.value.position.inSeconds.toInt(),
        _totalWatchedSeconds, _totalLoopsWatched);
    _watchTimer.cancel();
    super.dispose();
  }
}
