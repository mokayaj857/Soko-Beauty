import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_beauty/feautures/shop/views/screens/cart/cart.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/data/models/video_type.dart';
import 'package:soko_beauty/feautures/video/views/services/video_provider.dart';
import 'package:soko_beauty/feautures/video/views/widgets/comments.dart';
import 'package:soko_beauty/feautures/video/views/widgets/player.dart';
import 'package:soko_beauty/feautures/video/views/widgets/video_btn.dart';

class ProductsVideoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VideoProvider>(
      builder: (context, videoProvider, _) {
        return FutureBuilder<List<Video>>(
          future: videoProvider.getVideosByType(VideoType.Product),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              List<Video> productVideos = snapshot.data!;
              return PageView(
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                children: productVideos.map((video) {
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
                      shoppingCartPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartPage()),
                        );
                      },
                      bookingIconPressed: () {},
                      onSharePressed: () {},
                      currentTab: 'products',
                    ), onFollow: () {  }, soundName: '', ownerUsername: '',
                  );
                }).toList(),
              );
            } else {
              return Center(child: Text('No product videos available.'));
            }
          },
        );
      },
    );
  }
}
