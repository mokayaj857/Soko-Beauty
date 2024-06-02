import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/views/widgets/hashtags.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key , required this.videoInfo}) : super(key: key);

  final Video videoInfo;

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  bool isMinimized = true;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 6,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: isMinimized ? 120 : 220,
        width: isMinimized
            ? 300 // MediaQuery.of(context).size.width * 0.7
            : MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          left: 8,
          right: 8,
          top: 4,
          bottom: 0,
        ),
        color: isMinimized
            ? Colors.transparent
            : Theme.of(context).canvasColor.withOpacity(0.7),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.videoInfo.ownerId,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow:
                        isMinimized ? TextOverflow.ellipsis : TextOverflow.clip,
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      isMinimized ? Icons.arrow_upward_sharp : Icons.arrow_drop_down,
                    ),
                    onPressed: () {
                      setState(() {
                        isMinimized = !isMinimized;
                      });
                    },
                  ),
                ],
              ),
              Text(
                widget.videoInfo.description,
                style: TextStyle(
                  fontSize: 14,
                ),
                overflow:
                    isMinimized ? TextOverflow.ellipsis : TextOverflow.clip,
              ),
              Row(
                children: [
                  Text(
                    widget.videoInfo.likeCount.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "2 days ago",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    minRadius: 7,
                    backgroundColor: Colors.black54,
                    child: Icon(
                      Icons.audio_file_outlined,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Beauty by Godfrey Williams",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              HashtagsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
