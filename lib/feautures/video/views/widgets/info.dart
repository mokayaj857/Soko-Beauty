import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    required this.userAvatar,
  }) : super(key: key);

  final VoidCallback onFollow;
  final String username;
  final List<String> tags;
  final String description;
  final int views;
  final DateTime createdAt;
  final String userAvatar;

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
            bottom: VideoItemSizes.videoProgressBarHeight + 5
            // VideoItemSizes.videoSoundHeight
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 5, left: 2),
              child: Row(
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
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor.withOpacity(0.9),
                        width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            Theme.of(context).highlightColor.withOpacity(0.5),
                        radius: 16,
                        backgroundImage: widget.userAvatar.isNotEmpty
                            ? NetworkImage(widget.userAvatar)
                            : AssetImage("assets/user_avatar.png")
                                as ImageProvider,
                      ),
                      //positioned badge with plus icon
                      Positioned(
                        top: 10,
                        right: 0,
                        child: GestureDetector(
                          onTap: widget.onFollow,
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
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
            SizedBox(height: 8),
            if (widget.tags.isNotEmpty)
              HashtagsWidget(
                hashtags: widget.tags,
              ),
            SizedBox(height: 3),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.description.isNotEmpty || widget.tags.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0),
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
                                    fontSize: 12,
                                    color: Colors.white.withOpacity(0.93),
                                  ),
                                  overflow: isMinimized
                                      ? TextOverflow.ellipsis
                                      : null,
                                  maxLines: isMinimized ? 2 : null,
                                ),
                              ),
                              if (isMinimized &&
                                  widget.description.length > 60) ...[
                                SizedBox(width: 2),
                                _buildShowMoreButton(),
                              ],
                              if (!isMinimized) _buildHideButton(),
                            ],
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
