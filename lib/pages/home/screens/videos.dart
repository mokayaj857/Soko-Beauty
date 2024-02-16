import 'package:flutter/material.dart';
import 'package:soko_beauty/widgets/video/comments.dart';
import 'package:soko_beauty/widgets/video/info.dart';
import 'package:share_link/share_link.dart';
import 'package:soko_beauty/widgets/video/video_btn.dart';
import 'package:soko_beauty/widgets/video/video_tabbar.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  bool isLoading = true;
  bool showComments = false;

  void _shareContent() async {
    await ShareLink.shareUri(
      Uri.parse('https://2312.nl'),
      subject: '2312.nl website',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.loose, children: [
      VideoTabBar(),
      if (isLoading) ...[
        // Components displayed when not in loading state
        VideoActionButtons(
          onAddPressed: () {},
          onFavoritePressed: () {},
          onCommentPressed: () {
            setState(() {
              showComments = !showComments;
            });
          },
          onSharePressed: () {
            _shareContent();
          },
          shoppingCartPressed: () {},
        ),
        if (showComments) CommentSection(),
        VideoInfo(),
      ]
    ]);
  }
}
