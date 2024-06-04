import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';

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
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 520,
          maxHeight: isMinimized ? 120 : 220,
        ),
        width: isMinimized
            ? MediaQuery.of(context).size.width * 0.8
            : MediaQuery.of(context).size.width,
        height: isMinimized ? 120 : 220,
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white.withOpacity(0.5), width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage("https://picsum.photos/200"),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  widget.videoInfo.ownerId,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9)),
                  overflow:
                      isMinimized ? TextOverflow.ellipsis : TextOverflow.clip,
                ),
                SizedBox(width: 25),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.5), width: 1),
                  ),
                  child: Text(
                    "follow",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Row(
                children: [
                  Text(
                    "${widget.videoInfo.likeCount} views",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "•",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "2 days ago",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        widget.videoInfo.description,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.bold),
                        overflow: isMinimized ? TextOverflow.ellipsis : null,
                        maxLines: isMinimized ? 1 : null,
                      ),
                    ),
                  ),
                  SizedBox(width: 2),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMinimized = !isMinimized;
                      });
                    },
                    child: Text(
                      isMinimized ? "see more" : "hide",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7),
            // HashtagsWidget(),
          ],
        ),
      ),
    );
  }
}
