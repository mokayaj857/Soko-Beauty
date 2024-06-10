import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/views/widgets/hashtags.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key, required this.videoInfo, required this.onFollow, required this.ownerUsername}) : super(key: key);

  final Video videoInfo;
  final VoidCallback onFollow;
  final String ownerUsername;

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  bool isMinimized = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      constraints: BoxConstraints(
        maxWidth: 520,
        // maxHeight: isMinimized ? 120 : 250,
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        left: 8,
        right: 80,
        top: 0,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        gradient: !isMinimized
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.0),
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.5),
                ],
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
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
                  widget.ownerUsername,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9)),
                  overflow:
                      isMinimized ? TextOverflow.ellipsis : TextOverflow.clip,
                ),
                SizedBox(width: 25),
                GestureDetector(
                  onTap: widget.onFollow,
                  child: Container(
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
                ),
                Spacer(),
                if (!isMinimized)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMinimized = !isMinimized;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
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
                      timeAgo(widget.videoInfo.createdAt),
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
                    if (isMinimized) SizedBox(width: 2),
                    if (isMinimized)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isMinimized = !isMinimized;
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              "see more",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                              ),
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.keyboard_arrow_up,
                              color: Colors.blue,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              // SizedBox(height: 5),
              if (!isMinimized)
                HashtagsWidget(
                  hashtags: widget.videoInfo.tags,
                ),
              if (!isMinimized)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMinimized = !isMinimized;
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            "hide",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ],
          ),
        ],
      ),
    );
  }

  // convert video created date to time ago
  String timeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 365) {
      return "${(difference.inDays / 365).floor()} years ago";
    } else if (difference.inDays > 30) {
      return "${(difference.inDays / 30).floor()} months ago";
    } else if (difference.inDays > 7) {
      return "${(difference.inDays / 7).floor()} weeks ago";
    } else if (difference.inDays > 0) {
      return "${difference.inDays} days ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} hours ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} minutes ago";
    } else {
      return "just now";
    }
  }
}
