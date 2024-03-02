import 'package:flutter/material.dart';
import 'package:soko_beauty/video/screens/all_videos.dart';
import 'package:soko_beauty/video/screens/products_videos.dart';
import 'package:soko_beauty/video/screens/services_videos.dart';

class VideoTabBar extends StatefulWidget {
  const VideoTabBar({Key? key}) : super(key: key);

  @override
  _VideoTabBarState createState() => _VideoTabBarState();
}

class _VideoTabBarState extends State<VideoTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        body: Stack(
          children: [
            TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Expanded(child: AllVideosTab()),
                Expanded(child: ServicesVideosTab()),
                Expanded(child: ProductsVideoTab()),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SafeArea(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SafeArea(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SafeArea(
                child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.center,
                    dividerHeight: 0,
                    tabs: [
                      Tab(
                        text: 'All',
                      ),
                      Tab(
                        text: 'Sevices',
                      ),
                      Tab(
                        text: 'Products',
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
