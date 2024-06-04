import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/views/widgets/hashtags.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key, required this.videoInfo}) : super(key: key);

  final Video videoInfo;

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  bool isMinimized = true;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: isMinimized ? 120 : 220,
        constraints: BoxConstraints(
          maxWidth: 520,
        ),
        width: isMinimized
            ? MediaQuery.of(context).size.width * 0.8
            : MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          left: 8,
          right: 8,
          top: 4,
          bottom: 0,
        ),
        color: isMinimized ? Colors.transparent : Colors.black.withOpacity(0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage("https://picsum.photos/200"),
                ),
                SizedBox(width: 5),
                Text(
                  widget.videoInfo.ownerId,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9)),
                  overflow:
                      isMinimized ? TextOverflow.ellipsis : TextOverflow.clip,
                ),
              ],
            ),
            SizedBox(height: 3),
            Row(
              children: [
                Text(
                  widget.videoInfo.likeCount.toString() + " views",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9)),
                ),
                SizedBox(width: 8),
                Text(
                  "2 days ago",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9)),
                ),
                SizedBox(width: 45),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.5), width: 1),
                  ),
                  child: Text(
                    "Follow",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 3),
            Text(
              widget.videoInfo.description,
              style: TextStyle(
                  fontSize: 14, color: Colors.white.withOpacity(0.9)),
              overflow:
                  isMinimized ? TextOverflow.ellipsis : TextOverflow.clip,
            ),
            SizedBox(height: 7),
            // HashtagsWidget(),
          ],
        ),
      ),
    );
  }
}
