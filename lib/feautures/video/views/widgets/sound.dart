import 'package:flutter/material.dart';
import 'package:soko_beauty/config/styles/video_styles.dart';

class VideoSound extends StatelessWidget {
  final String SoundTitle;
  final VoidCallback onUseSound;

  const VideoSound(
      {super.key, required this.SoundTitle, required this.onUseSound});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: VideoItemPosition.sound.bottom,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 35,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                padding: EdgeInsets.symmetric(horizontal: 1.75, vertical: 1.75),
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
              SoundTitle,
              style:
                  TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.9)),
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(
              flex: 1,
            ),
            GestureDetector(
              onTap: onUseSound,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                      "use this VideoSound",
                      style: TextStyle(
                          fontSize: 11, color: Colors.white.withOpacity(0.9)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
