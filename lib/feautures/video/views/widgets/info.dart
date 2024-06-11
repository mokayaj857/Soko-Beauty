import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soko_beauty/config/colors/global_colors.dart';
import 'package:soko_beauty/config/styles/video_styles.dart';
import 'package:soko_beauty/core/utils/video_utils.dart';
import 'package:soko_beauty/feautures/video/views/widgets/hashtags.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({
    Key? key,
    required this.onFollow,
    required this.username,
    required this.tags,
    required this.description,
    required this.views,
    required this.createdAt,
  }) : super(key: key);

  final VoidCallback onFollow;
  final String username;
  final List<String> tags;
  final String description;
  final int views;
  final DateTime createdAt;

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  bool isMinimized = true;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: VideoItemPosition.info.bottom,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        constraints: BoxConstraints(
          maxWidth: 520,
        ),
        decoration: !isMinimized
            ? BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              )
            : null,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            left: 10,
            right: 70,
            top: 5,
            bottom: VideoItemSizes.videoProgressBarHeight +
                VideoItemSizes.videoSoundHeight),
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
                        color: AppColors.primary.withOpacity(0.5), width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage:
                            NetworkImage("https://picsum.photos/200"),
                      ),
                      //positioned badge with plus icon
                      GestureDetector(
                        onTap: widget.onFollow,
                        child: Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add_outlined,
                              color: Colors.white,
                              size: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  widget.username,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9)),
                  overflow:
                      isMinimized ? TextOverflow.ellipsis : TextOverflow.clip,
                ),
                SizedBox(width: 7),
                Row(
                  children: [
                    Text(
                      "${widget.views}",
                      style: TextStyle(
                          fontSize: 10, color: Colors.white.withOpacity(0.9)),
                    ),
                    SizedBox(width: 3),
                    Icon(
                      CupertinoIcons.eye_fill,
                      color: Colors.white.withOpacity(0.9),
                      size: 14,
                    ),
                    SizedBox(width: 8),
                    Text(
                      timeAgo(widget.createdAt),
                      style: TextStyle(
                          wordSpacing: 0.5,
                          fontSize: 10,
                          color: Colors.white.withOpacity(0.9)),
                    ),
                  ],
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
                          size: 20,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.description.isNotEmpty || widget.tags.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.description.isNotEmpty)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.description,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                  overflow: isMinimized
                                      ? TextOverflow.ellipsis
                                      : null,
                                  maxLines: isMinimized ? 1 : null,
                                ),
                              ),
                              if (isMinimized &&
                                  widget.description.length > 30) ...[
                                SizedBox(width: 2),
                                _buildShowMoreButton(),
                              ],
                              if (!isMinimized) _buildHideButton(),
                            ],
                          ),
                        if (!isMinimized && widget.tags.isNotEmpty)
                          HashtagsWidget(
                            hashtags: widget.tags,
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShowMoreButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMinimized = !isMinimized;
        });
      },
      child: Row(
        children: [
          Text(
            "show more",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHideButton() {
    return GestureDetector(
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
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
