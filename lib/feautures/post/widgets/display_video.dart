import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoContainer extends StatefulWidget {
  final VideoPlayerController controller;
  final bool showPlayButton;

  VideoContainer({
    required this.controller,
    required this.showPlayButton,
  });

  @override
  _VideoContainerState createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  late VideoPlayerController _controller;
  bool _showPlayButton = true;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _showPlayButton = widget.showPlayButton;

    _controller.addListener(() {
      setState(() {
        // This will ensure the play button is shown/hidden based on the playing state
        _showPlayButton = !_controller.value.isPlaying;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(0.0),
      margin: EdgeInsets.all(0.0),
      clipBehavior: Clip.antiAlias,
      constraints: BoxConstraints(maxHeight: 200.0, maxWidth: 200.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              _controller.value.isInitialized
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                          }
                        });
                      },
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    )
                  : Container(),
              Visibility(
                visible: _showPlayButton,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                  icon: Icon(
                    CupertinoIcons.play_arrow_solid,
                    size: 30.0,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    playedColor: Theme.of(context).primaryColor,
                    bufferedColor: const Color.fromARGB(139, 158, 158, 158),
                    backgroundColor: const Color.fromARGB(76, 0, 0, 0),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  icon: Icon(
                    CupertinoIcons.fullscreen,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _showBottomSheet(context);
                  },
                ),
              ),
              Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _controller.value.position.toString().split('.').first,
                        style: TextStyle(color: Colors.white, fontSize: 10.0),
                      ),
                      Text(
                        _controller.value.duration.toString().split('.').first,
                        style: TextStyle(color: Colors.white, fontSize: 10.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showDialog(
      useSafeArea: true,
      barrierColor: Colors.black.withOpacity(0.2),
      context: context,
      builder: (context) {
        return Container(
          clipBehavior: Clip.antiAlias,
          padding: EdgeInsets.all(0.0),
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.black,
          ),
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      VideoPlayer(_controller),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: IconButton(
                          icon: Icon(
                            CupertinoIcons.clear_thick,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Visibility(
                        visible: _showPlayButton,
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (_controller.value.isPlaying) {
                                  _controller.pause();
                                } else {
                                  _controller.play();
                                }
                              });
                            },
                            icon: Icon(
                              CupertinoIcons.play_arrow_solid,
                              size: 50.0,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    playedColor: Theme.of(context).primaryColor,
                    bufferedColor: const Color.fromARGB(139, 158, 158, 158),
                    backgroundColor: const Color.fromARGB(76, 0, 0, 0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _controller.value.position.toString().split('.').first,
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      ),
                      Text(
                        _controller.value.duration.toString().split('.').first,
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
