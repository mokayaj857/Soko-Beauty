import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/video/data/dummy/videos.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/views/widgets/comments.dart';
import 'package:soko_beauty/feautures/video/views/widgets/player.dart';
import 'package:soko_beauty/feautures/video/views/widgets/video_btn.dart';

class ServicesVideosTab extends StatefulWidget {
  @override
  _ServicesVideosTabState createState() => _ServicesVideosTabState();
}

class _ServicesVideosTabState extends State<ServicesVideosTab> {
  List<Video> allVideos = fetchDummyData(); // Change the type to List<Video>

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      children: allVideos.map((video) {
        return VideoPlayerScreen(
          videoInfo: video,
          videoActions: VideoActionButtons(
            onAddPressed: () {},
            onFavoritePressed: () {},
            onCommentPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CommentSection();
                  });
            },
            shoppingCartPressed: () {},
            onSharePressed: () {},
            currentTab: 'services',
          ),
        ); // Pass the entire Video object
      }).toList(),
    );
  }
}
