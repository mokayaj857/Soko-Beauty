import 'package:flutter/material.dart';
import 'package:soko_beauty/config/styles/video_styles.dart';

class VideoSound extends StatefulWidget {
  final String soundTitle;
  final VoidCallback onUseSound;

  const VideoSound({
    super.key,
    required this.soundTitle,
    required this.onUseSound,
  });

  @override
  _VideoSoundState createState() => _VideoSoundState();
}

class _VideoSoundState extends State<VideoSound>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
    _animation = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset(-1, 0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: VideoItemPosition.sound.bottom,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: VideoItemSizes.videoSoundHeight,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        child: Row(
          children: [
            SizedBox(width: 4),
            Container(
              // constraints: BoxConstraints(maxWidth: 200),
              // child:
              //  ClipRect(
              //   child: SlideTransition(
              // position: _animation,
              child: Text(
                widget.soundTitle,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.9),
                ),
                //   ),
                // ),
              ),
            ),
            Spacer(),
            // GestureDetector(
            //   onTap: widget.onUseSound,
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       gradient: LinearGradient(
            //         colors: [
            //           Colors.red.withOpacity(0.4),
            //           Colors.blue.withOpacity(0.4),
            //         ],
            //       ),
            //       border: Border.all(
            //         color: Colors.white.withOpacity(0.35),
            //         width: 0.03,
            //       ),
            //     ),
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.videocam,
            //           color: Colors.white.withOpacity(0.9),
            //           size: 16,
            //         ),
            //         SizedBox(width: 4),
            //         Text(
            //           "use sound",
            //           style: TextStyle(
            //             fontSize: 11,
            //             color: Colors.white.withOpacity(0.9),
            //           ),
            //           overflow: TextOverflow.ellipsis,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            RotationTransition(
              turns: _controller,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 1.75, vertical: 1.75),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.35),
                    width: 3,
                  ),
                ),
                child: Icon(
                  Icons.music_note,
                  color: Colors.white.withOpacity(0.9),
                  size: 13,
                ),
              ),
            ),
            SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}
