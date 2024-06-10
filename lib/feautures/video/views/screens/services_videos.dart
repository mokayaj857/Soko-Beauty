import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_beauty/feautures/shop/views/widgets/book_widget.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/data/models/video_type.dart';
import 'package:soko_beauty/feautures/video/views/services/video_provider.dart';
import 'package:soko_beauty/feautures/video/views/widgets/comments.dart';
import 'package:soko_beauty/feautures/video/views/widgets/player.dart';
import 'package:soko_beauty/feautures/video/views/widgets/video_btn.dart';

class ServicesVideosTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VideoProvider>(
      builder: (context, videoProvider, _) {
        return FutureBuilder<List<Video>>(
          future: videoProvider.getVideosByType(VideoType.Service),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  child: Center(child: CircularProgressIndicator()));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              List<Video> serviceVideos = snapshot.data!;
              return PageView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                children: serviceVideos.map((video) {
                  return VideoPlayerScreen(
                    videoInfo: video,
                    videoActions: VideoActionButtons(
                      onFavoritePressed: () {},
                      onCommentPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CommentSection();
                          },
                        );
                      },
                      bookingIconPressed: () {
                        showModalBottomSheet(
                          backgroundColor: Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0.95),
                          elevation: 0.0,
                          context: context,
                          builder: (context) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: BookingWidget(),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      shoppingCartPressed: () {},
                      onSharePressed: () {},
                      currentTab: 'services',
                    ),
                    onFollow: () {},
                    soundName: '',
                    ownerUsername: '',
                  );
                }).toList(),
              );
            } else {
              return Center(child: Text('No service videos available.'));
            }
          },
        );
      },
    );
  }
}
