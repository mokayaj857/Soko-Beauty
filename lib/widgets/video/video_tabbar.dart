import 'package:flutter/material.dart';
import 'package:soko_beauty/widgets/video/tabs/following_videos.dart';
import 'package:soko_beauty/widgets/video/tabs/suggested_video.dart';

class VideoTabBar extends StatefulWidget {
  const VideoTabBar({Key? key}) : super(key: key);

  @override
  _VideoTabBarState createState() => _VideoTabBarState();
}

class _VideoTabBarState extends State<VideoTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
      length: 2, // Number of tabs
      child: Scaffold(
        body: Stack(
          children: [
            TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Expanded(child: FollowingVideosTab()),
                Expanded(child: SuggestedVideoTab()),
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
                    isScrollable: false,

                    tabAlignment: TabAlignment.center,
                    dividerHeight: 0,
                    tabs: [
                      Tab(
                        text: 'Following',
                      ),
                      Tab(
                        text: 'Suggested',
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
