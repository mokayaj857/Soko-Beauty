import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/shop/views/screens/cart/cart.dart';
import 'package:soko_beauty/feautures/video/data/dummy/videos.dart';
import 'package:soko_beauty/feautures/video/data/models/video.dart';
import 'package:soko_beauty/feautures/video/views/widgets/comments.dart';
import 'package:soko_beauty/feautures/video/views/widgets/player.dart';
import 'package:soko_beauty/feautures/video/views/widgets/video_btn.dart';

class ProductsVideoTab extends StatefulWidget {
  @override
  State<ProductsVideoTab> createState() => _ProductsVideoTabState();
}

class _ProductsVideoTabState extends State<ProductsVideoTab> {
  List<Video> allVideos = fetchDummyData(); // Change the type to List<Video>

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: AlwaysScrollableScrollPhysics(),
      children: allVideos.map((video) {
        return VideoPlayerScreen(
            videoInfo: video, videoActions: VideoActionButtons(
            onAddPressed: () {},
            onFavoritePressed: () {},
            onCommentPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CommentSection();
                  });
            },
            shoppingCartPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            onSharePressed: () {},
            currentTab: 'products',
          ),); // Pass the entire Video object
      }).toList(),
    );
  }
}
