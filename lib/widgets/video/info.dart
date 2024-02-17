import 'package:flutter/material.dart';
import 'package:soko_beauty/widgets/video/hashtags.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  bool isMinimized = true;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: isMinimized ? 120 : 220,
        width: isMinimized
            ? 300 // MediaQuery.of(context).size.width * 0.7
            : MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          left: 8,
          right: 8,
          top: 8,
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
                    "@Sokobeauty",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      isMinimized ? Icons.arrow_upward : Icons.arrow_downward,
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
                "Darling style | A more detailed info about this video",
                style: TextStyle(
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Text(
                    "1.2M views",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "2 days ago",
                    style: TextStyle(
                      fontSize: 14,
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
